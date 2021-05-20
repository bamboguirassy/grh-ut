import { Component, OnInit, OnDestroy, Output, EventEmitter, Input, ViewChild, ElementRef } from '@angular/core';
import { Contrat } from '../contrat';
import { ContratService } from '../contrat.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { DatePipe, Location } from '@angular/common';
import { TypeContrat } from 'src/app/pages/parametrage/typecontrat/typecontrat';
import { TypeContratService } from 'src/app/pages/parametrage/typecontrat/typecontrat.service';
import { type } from 'jquery';
import { EmployeService } from '../../employe/employe.service';

@Component({
  selector: 'app-contrat-edit',
  templateUrl: './contrat-edit.component.html',
  styleUrls: ['./contrat-edit.component.scss']
})
export class ContratEditComponent implements OnInit, OnDestroy {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  isModalVisible = false;
  entity: Contrat;
  @Output() modification: EventEmitter<Contrat> = new EventEmitter();
  @Output() onClose: EventEmitter<any> = new EventEmitter();
  typeContrats: TypeContrat[] = [];
  @Input() set selectedContrat(value) {
    this.entity = value;
    this.selectedTypeContrat = this.entity.typeContrat;
    this.selectedTypeContratId = this.selectedTypeContrat.id;
    this.motifFinContrat=this.entity.motifFin;
    this.handlePostLoad();
    this.openModal();
  }
  motifFinContrat: any;
  motifFinContrats: any = [];
  selectedTypeContrat: TypeContrat;
  selectedTypeContratId: any;

  constructor(store: Store<IAppState>,
    public contratSrv: ContratService,
    public employeSrv:EmployeService,
    public typeContratSrv: TypeContratService,
    public router: Router,
    private activatedRoute: ActivatedRoute,
    public location: Location, public datePipe: DatePipe) {
  }

  ngOnInit(): void {
    this.motifFinContrats = this.employeSrv.motifSorties;
    this.findTypeContrats();
  }

  ngOnDestroy() {
  }

  // open modal window
  openModal() {
    this.isModalVisible = true;
  }

  // close modal window
  closeModal() {
    this.onClose.emit();
    this.isModalVisible = false;
  }

  handlePostLoad() {
  }

  prepareUpdate() {
    this.entity.motifFin = this.motifFinContrat;
    this.entity.typeContrat = this.selectedTypeContratId;
    this.entity.dateSignature = this.datePipe.transform(this.entity.dateSignature, 'yyyy-MM-dd');
    this.entity.dateFinEffective = this.datePipe.transform(this.entity.dateFinEffective, 'yyyy-MM-dd');
    this.entity.dateDebut = this.datePipe.transform(this.entity.dateDebut, 'yyyy-MM-dd');
    if (!this.entity.etat) {
      this.entity.motifFin = null;
      this.entity.dateFinEffective = null;
      this.entity.commentaireSurFinContrat = null;
    }
    if (this.selectedTypeContrat.code == 'CDI') {
      this.entity.dureeEnMois = null;
      this.entity.dateFinEffective = null;
    }
  }

  //stocker dans la valeur de l'id selectionner son objet
  handleTypeContratChange(typeContratId): void {
    this.selectedTypeContrat = this.typeContrats.find(typeContrat => typeContrat.id == typeContratId);
  }

  handlePostUpdate() {
    this.location.back();
  }

  update() {
    this.prepareUpdate();
    this.contratSrv.update(this.entity)
      .subscribe((resp: any) => {
        this.closeModal();
        this.modification.emit(resp);
      }, (err) => {
        this.contratSrv.httpSrv.catchError(err);
      });
  }

  findTypeContrats() {
    return this.typeContratSrv.findAll()
      .subscribe((data: any) => {
        this.typeContrats = data;
      }, err => this.typeContratSrv.httpSrv.catchError(err));
  }

  handleDureeChange(dureeValue) {
    if (dureeValue && this.selectedTypeContrat?.code != 'CDI' && this.entity.dateDebut) {
      let dateDeb = new Date(this.entity.dateDebut);
      const duree = +dureeValue;
      let dateFin = dateDeb.setMonth(dateDeb.getMonth() + duree);
      this.entity.dateFinPrevue = dateFin;
    } else {
      this.entity.dateFinPrevue = null;
    }
    this.entity.dateFinPrevue = this.datePipe.transform(this.entity.dateFinPrevue, 'yyyy-MM-dd');

  }

  handleDateDebutChange(newDate) {
    if (newDate && this.selectedTypeContrat?.code != 'CDI' && this.entity.dureeEnMois) {
      let dateDeb = new Date((this.entity.dateDebut));
      let duree = +this.entity.dureeEnMois;
      let dateFin = dateDeb.setMonth(dateDeb.getMonth() + duree);
      this.entity.dateFinPrevue = dateFin;
    } else {
      this.entity.dateFinPrevue = null;
    }
    this.entity.dateFinPrevue = this.datePipe.transform(this.entity.dateFinPrevue, 'yyyy-MM-dd');
    console.log(this.entity.dateFinPrevue);

  }
}
