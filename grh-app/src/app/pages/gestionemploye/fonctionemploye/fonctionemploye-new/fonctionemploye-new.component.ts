import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren, Input } from '@angular/core';
import { FonctionEmployeService } from '../fonctionemploye.service';
import { FonctionEmploye } from '../fonctionemploye';
import { Router } from '@angular/router';
import { Structure } from 'src/app/pages/parametrage/structure/structure';
import { Employe } from '../../employe/employe';
import { StructureFonctionService } from 'src/app/pages/parametrage/structurefonction/structurefonction.service';
import { StructureFonction } from 'src/app/pages/parametrage/structurefonction/structurefonction';
import { StructureService } from 'src/app/pages/parametrage/structure/structure.service';
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
  structureFonctions: StructureFonction[] = [];
  selectedStructureFonction: StructureFonction;
  @Input() employe: Employe;
  structures: Structure[] = [];
  selectedStructure: Structure;

  constructor(public fonctionEmployeSrv: FonctionEmployeService,
    public router: Router, public structureFonctionSrv: StructureFonctionService,
    public structureSrv: StructureService, public datePipe: DatePipe) {
    this.entity = new FonctionEmploye();
  }

  ngOnInit(): void {
    this.findStructures();   
  }

  save() {
    this.entity.employe = this.employe.id;
    this.entity.responsabilite = this.selectedStructureFonction.id;
    this.entity.datePriseFonction = this.datePipe.transform(this.entity.datePriseFonction,'yyyy-MM-dd');
    this.entity.dateFin = this.datePipe.transform(this.entity.dateFin,'yyyy-MM-dd');
    if (this.entity.etat && !this.entity.responsabilite.duree) {
      this.entity.dateFin = null;
    }
    this.fonctionEmployeSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.selectedStructureFonction=null;
        this.selectedStructure=null;
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

  findStructureFonctionsByStructure(selectedStructure: Structure) {
    this.selectedStructureFonction = null;
    return this.structureFonctionSrv.findByStructure(selectedStructure)
      .subscribe((data: any) => {
        this.structureFonctions = data;
      }, err => this.structureFonctionSrv.httpSrv.catchError(err));
  }

  findStructures() {
    return this.structureSrv.findAll()
      .subscribe((data: any) => {
        this.structures = data;
      }, err => this.structureSrv.httpSrv.catchError(err));
  }
  
  handleDatePriseFonctionChange(newDate) {
    let datePrise = new Date(newDate);
    let duree = +this.selectedStructureFonction.duree;
    let dateFin = datePrise.setMonth(datePrise.getMonth() + duree);
    this.entity.dateFin = dateFin;
}

}

