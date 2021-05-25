import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren, Input } from '@angular/core';
import { ContratService } from '../contrat.service';
import { Contrat } from '../contrat';
import { Router } from '@angular/router';
import { Employe } from '../../employe/employe';
import { TypeContrat } from 'src/app/pages/parametrage/typecontrat/typecontrat';
import { TypeContratService } from 'src/app/pages/parametrage/typecontrat/typecontrat.service';
import { DatePipe } from '@angular/common';
import { EmployeService } from '../../employe/employe.service';
import { IAppState } from 'src/app/interfaces/app-state';

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
  contrats: Contrat[] = [];
  selectedTypeContrat: any;
  motifFinContrats: any = [];
  contratActif: Contrat;

  constructor(public contratSrv: ContratService,
    public typeContratSrv: TypeContratService,
    public employeSrv: EmployeService, public datePipe: DatePipe,
    public router: Router) {
    this.initNewContrat();
  }

  ngOnInit(): void {
    this.motifFinContrats = this.employeSrv.motifSorties;
    this.findByEmploye();
  }

  save() {
    this.entity.employe = this.employe.id;
    if (this.selectedTypeContrat) {
      this.entity.typeContrat = this.selectedTypeContrat.id;
    }
    if (this.entity.typeContrat.code == 'CDI') {
      this.entity.dureeEnMois = null;
      this.entity.dateFinPrevue = null;
    }
    if (this.entity.dateFinEffective) {
      this.entity.dateFinEffective = this.datePipe.transform(this.entity.dateFinEffective, 'yyyy-MM-dd');
    }
    if (this.entity.dateSignature) {
      this.entity.dateSignature = this.datePipe.transform(this.entity.dateSignature, 'yyyy-MM-dd');
    }
    if (this.entity.dateDebut) {
      this.entity.dateDebut = this.datePipe.transform(this.entity.dateDebut, 'yyyy-MM-dd');
    }
    if (this.entity.dateFinPrevue) {
      this.entity.dateFinPrevue = this.datePipe.transform(this.entity.dateFinPrevue, 'yyyy-MM-dd');
    }
    if (this.entity.etat) {
      this.entity.motifFin = null;
      this.entity.dateFinEffective = null;
      this.entity.commentaireSurFinContrat = null;
      this.createContrat();
    }
    else if (this.entity.motifFin && this.entity.dateFinEffective) {
      this.createContrat();
    }
  }

  createContrat() {
    this.contratSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.initNewContrat();
      }, error => this.contratSrv.httpSrv.catchError(error));
  }
  
  initNewContrat() {
    this.entity = new Contrat();
    this.entity.etat = true;
    this.entity.typeContrat = null;
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
      this.entity.dateFinPrevue = dateFin;
    } else {
      this.entity.dateFinPrevue = null;
    }
  }

  handleDateDebutChange(newDate) {
    if (newDate && this.selectedTypeContrat?.code != 'CDI' && this.entity.dureeEnMois) {
      let dateDeb = new Date(newDate);
      let duree = +this.entity.dureeEnMois;
      let dateFin = dateDeb.setMonth(dateDeb.getMonth() + duree);
      this.entity.dateFinPrevue = dateFin;
    } else {
      this.entity.dateFinPrevue = null;
    }
  }

  findByEmploye() {
    this.contratSrv.findByEmploye(this.employe)
      .subscribe((data: any) => {
        this.contrats = data;
        this.contratActif = this.contrats.find(contrat => contrat.etat);
      }, err => this.contratSrv.httpSrv.catchError(err));
  }



}

