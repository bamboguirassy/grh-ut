import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren, Input } from '@angular/core';
import { ContratService } from '../contrat.service';
import { Contrat } from '../contrat';
import { Router } from '@angular/router';
import { Employe } from '../../employe/employe';
import { TypeContrat } from 'src/app/pages/parametrage/typecontrat/typecontrat';
import { TypeContratService } from 'src/app/pages/parametrage/typecontrat/typecontrat.service';
import { DatePipe } from '@angular/common';
import { EmployeService } from '../../employe/employe.service';

@Component({
  selector: 'app-contrat-new',
  templateUrl: './contrat-new.component.html',
  styleUrls: ['./contrat-new.component.scss']
})
export class ContratNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Contrat;
  @Output() creation: EventEmitter<Contrat> = new EventEmitter();
  isModalVisible = false;

  @Input() employe: Employe;

  typeContrats: TypeContrat[] = [];
  selectedTypeContrat: any;
  motifSortie: string;
  commentaireSortie: any;
  dateSortie: any;
  motifSorties: any = [];
  selectedMotifEmploye: any;

  constructor(public contratSrv: ContratService,
    public typeContratSrv: TypeContratService,
    public employeSrv: EmployeService, public datePipe: DatePipe,
    public router: Router) {
    this.entity = new Contrat();
  }

  ngOnInit(): void {
    this.commentaireSortie = this.employe.commentaireSortie;
    this.dateSortie = this.employe.dateSortie;
    this.motifSorties = this.employeSrv.motifSorties;
    this.motifSortie = this.entity.employe.motifSortie;
    console.log(this.motifSortie);
    
  }

  save() {
    this.entity.employe = this.employe.id;
    this.entity.commentaire = this.commentaireSortie
    this.entity.dateRupture = this.dateSortie
    if (this.selectedTypeContrat) {
      this.entity.typeContrat = this.selectedTypeContrat.id;
    }
    this.entity.motifRupture = this.motifSortie;

    if (!this.entity.rompu) {
      this.entity.motifRupture = null;
      this.entity.dateRupture = null;
      this.entity.commentaire = null;
    }
    if (this.entity.typeContrat.code == 'CDI') {
      this.entity.dureeEnMois = null;
      this.entity.dateFin = null;
    }
    if (this.entity.dateRupture) {
      this.entity.dateRupture = this.datePipe.transform(this.entity.dateRupture, 'yyyy-MM-dd');
    }
    if (this.entity.dateSignature) {
      this.entity.dateSignature = this.datePipe.transform(this.entity.dateSignature, 'yyyy-MM-dd');
    }
    if (this.entity.dateDebut) {
      this.entity.dateDebut = this.datePipe.transform(this.entity.dateDebut, 'yyyy-MM-dd');
    }
    if (this.entity.dateFin) {
      this.entity.dateFin = this.datePipe.transform(this.entity.dateFin, 'yyyy-MM-dd');
    }
    this.contratSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Contrat();
      }, error => this.contratSrv.httpSrv.catchError(error));

  }

  initNewContrat() {
    this.entity = new Contrat();
  }

  // open modal window
  openModal() {
    this.isModalVisible = true;
    this.findTypeContrats();
  }

  // close modal window
  closeModal() {
    this.isModalVisible = false;
  }

  findTypeContrats() {
    this.typeContratSrv.findAll()
      .subscribe((data: any) => {
        this.typeContrats = data;
      }, err => this.typeContratSrv.httpSrv.catchError(err));
  }

  handleDureeChange(dureeValue) {
    if (dureeValue && this.selectedTypeContrat?.code != 'CDI' && this.entity.dateDebut) {
      let dateDeb = new Date(this.entity.dateDebut);
      const duree = +dureeValue;
      let dateFin = dateDeb.setMonth(dateDeb.getMonth() + duree);
      this.entity.dateFin = dateFin;
    } else {
      this.entity.dateFin = null;
    }
  }

  handleDateDebutChange(newDate) {
    if (newDate && this.selectedTypeContrat?.code != 'CDI' && this.entity.dureeEnMois) {
      let dateDeb = new Date(newDate);
      let duree = +this.entity.dureeEnMois;
      let dateFin = dateDeb.setMonth(dateDeb.getMonth() + duree);
      this.entity.dateFin = dateFin;
    } else {
      this.entity.dateFin = null;
    }
  }


}

