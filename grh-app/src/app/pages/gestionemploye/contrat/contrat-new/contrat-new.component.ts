import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren, Input } from '@angular/core';
import { ContratService } from '../contrat.service';
import { Contrat } from '../contrat';
import { Router } from '@angular/router';
import { Employe } from '../../employe/employe';
import { TypeContrat } from 'src/app/pages/parametrage/typecontrat/typecontrat';
import { TypeContratService } from 'src/app/pages/parametrage/typecontrat/typecontrat.service';
import { DatePipe } from '@angular/common';

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
  selectedTypeContrat: TypeContrat;

  constructor(public contratSrv: ContratService,
    public typeContratSrv: TypeContratService, public datePipe: DatePipe,
    public router: Router) {
    this.entity = new Contrat();
  }

  ngOnInit(): void { }

  save() {
    this.entity.employe = this.employe.id;
    if (this.selectedTypeContrat) {
      this.entity.typeContrat = this.selectedTypeContrat.id;
    }
    if (!this.entity.rompu){
      this.entity.motifRupture=null;
      this.entity.dateRupture=null;
    }
    if(this.entity.typeContrat.code=='CDI'){
      this.entity.dureeEnMois=null;
    }
    if (this.entity.dateRupture) {
      this.entity.dateRupture = this.datePipe.transform(this.entity.dateRupture, 'yyyy-MM-dd');
    }
    if (this.entity.dateSignature) {
      this.entity.dateSignature = this.datePipe.transform(this.entity.dateSignature, 'yyyy-MM-dd');
    }
    this.contratSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Contrat();
      }, error => this.contratSrv.httpSrv.catchError(error));
    
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


}

