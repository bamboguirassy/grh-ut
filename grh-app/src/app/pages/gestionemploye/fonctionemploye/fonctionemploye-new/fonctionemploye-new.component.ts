import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren, Input } from '@angular/core';
import { FonctionEmployeService } from '../fonctionemploye.service';
import { FonctionEmploye } from '../fonctionemploye';
import { Router } from '@angular/router';
import { Fonction } from 'src/app/pages/parametrage/fonction/fonction';
import { Structure } from 'src/app/pages/parametrage/structure/structure';
import { TypeContrat } from 'src/app/pages/parametrage/typecontrat/typecontrat';
import { Employe } from '../../employe/employe';
import { FonctionService } from 'src/app/pages/parametrage/fonction/fonction.service';
import { StructureService } from 'src/app/pages/parametrage/structure/structure.service';
import { TypeContratService } from 'src/app/pages/parametrage/typecontrat/typecontrat.service';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-fonctionemploye-new',
  templateUrl: './fonctionemploye-new.component.html',
  styleUrls: ['./fonctionemploye-new.component.scss']
})
export class FonctionEmployeNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: FonctionEmploye;
  @Output() creation: EventEmitter<FonctionEmploye> = new EventEmitter();
  isModalVisible = false;
  fonctions: Fonction[] = [];
  selectedFonction: Fonction;
  @Input() employe: Employe;
  structures: Structure[] = [];
  selectedStructure: Structure;
  

  constructor(public fonctionEmployeSrv: FonctionEmployeService,
    public router: Router, public fonctionSrv: FonctionService,
    public structureSrv: StructureService, public datePipe: DatePipe) {
    this.entity = new FonctionEmploye();
  }

  ngOnInit(): void {
    this.findFonctions();
    this.findStructures();
   
  }

  save() {
    
    this.entity.employe = this.employe.id;
    this.entity.fonction = this.selectedFonction.id;
    this.entity.structure = this.selectedStructure.id;
    this.entity.datePriseFonction = this.datePipe.transform(this.entity.datePriseFonction,'yyyy-MM-dd');
    this.entity.dateFin = this.datePipe.transform(this.entity.dateFin,'yyyy-MM-dd');
    this.fonctionEmployeSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new FonctionEmploye();
      }, error => this.fonctionEmployeSrv.httpSrv.catchError(error));
  }

  // open modal window
  openModal() {
    this.isModalVisible = true;
  }

  // close modal window
  closeModal() {
    this.isModalVisible = false;
  }

  findFonctions() {
    return this.fonctionSrv.findAll()
      .subscribe((data: any) => {
        this.fonctions = data;
      }, err => this.fonctionSrv.httpSrv.catchError(err));
  }

  findStructures() {
    return this.structureSrv.findAll()
      .subscribe((data: any) => {
        this.structures = data;
      }, err => this.structureSrv.httpSrv.catchError(err));
  }

  

}

