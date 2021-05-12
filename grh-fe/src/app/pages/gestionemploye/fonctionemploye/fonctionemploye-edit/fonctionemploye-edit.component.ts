import { FonctionService } from 'src/app/pages/parametrage/fonction/fonction.service';
import { TypeContratService } from 'src/app/pages/parametrage/typecontrat/typecontrat.service';
import { StructureService } from 'src/app/pages/parametrage/structure/structure.service';
import { Component, OnInit, OnDestroy, ViewChild, ViewChildren, ElementRef, Input, Output, EventEmitter } from '@angular/core';
import { FonctionEmploye } from '../fonctionemploye';
import { FonctionEmployeService } from '../fonctionemploye.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location, DatePipe } from '@angular/common';
import { Fonction } from 'src/app/pages/parametrage/fonction/fonction';
import { Structure } from 'src/app/pages/parametrage/structure/structure';
import { TypeContrat } from 'src/app/pages/parametrage/typecontrat/typecontrat';
import { StructureFonctionService } from 'src/app/pages/parametrage/structurefonction/structurefonction.service';
import { StructureFonction } from 'src/app/pages/parametrage/structurefonction/structurefonction';

@Component({
  selector: 'app-fonctionemploye-edit',
  templateUrl: './fonctionemploye-edit.component.html',
  styleUrls: ['./fonctionemploye-edit.component.scss']
})
export class FonctionEmployeEditComponent implements OnInit, OnDestroy {
  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: FonctionEmploye;
  @Output() modification: EventEmitter<FonctionEmploye> = new EventEmitter();
  @Output() onClose: EventEmitter<any> = new EventEmitter();
  @Input() set selectedFonction(value){
    this.entity = value;
    this.handlePostLoad();
    this.openModal();
  }
  structures: Structure[] = [];
  selectedStructure: any;
  isModalVisible = false;
  fonctions: StructureFonction[] = [];
  selectedFonctionId: any;

  constructor(store: Store<IAppState>,
              public fonctionEmployeSrv: FonctionEmployeService,
              public router: Router,  public structureFonctionSrv: StructureFonctionService,
              private activatedRoute: ActivatedRoute, public structureSrv: StructureService,
              public location: Location, public datePipe: DatePipe) {
    
  }

  ngOnInit(): void {
    this.findStructures();
   
  }

  ngOnDestroy() {

  }

  handlePostLoad() {
    this.selectedFonctionId = this.entity.responsabilite?.id;
    if(this.entity.responsabilite) {
      this.fonctions.push(this.entity.responsabilite);
    }
    this.entity.datePriseFonction = this.datePipe.transform(this.entity.datePriseFonction, 'yyyy-MM-dd');
    this.entity.dateFin = this.datePipe.transform(this.entity.dateFin, 'yyyy-MM-dd');
  }

  prepareUpdate() {
    
  }

  update() {
    this.entity.responsabilite = this.selectedFonctionId;
    this.entity.dateFin = this.datePipe.transform(this.entity.dateFin, 'yyyy-MM-dd');   
    if(this.entity.etat){
      this.entity.dateFin = null;
    }
    this.entity.datePriseFonction = this.datePipe.transform(this.entity.datePriseFonction, 'yyyy-MM-dd');
    this.fonctionEmployeSrv.update(this.entity)
      .subscribe((resp: any) => {
        console.log(this.entity);
        this.closeModal();
        this.modification.emit(resp);
      },(err)=>{
        this.fonctionEmployeSrv.httpSrv.catchError(err);
      });
  }

  handlePostUpdate() {
    this.location.back();
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

  findFonctionsByStructure(structure: Structure) {
    return this.structureFonctionSrv.findByStructure(structure)
      .subscribe((data: any) => {
        this.fonctions = data;
      }, err => this.fonctionEmployeSrv.httpSrv.catchError(err));
  }

  findStructures() {
    return this.structureSrv.findAll()
      .subscribe((data: any) => {
        this.structures = data;
      }, err => this.structureSrv.httpSrv.catchError(err));
  }

  


}
