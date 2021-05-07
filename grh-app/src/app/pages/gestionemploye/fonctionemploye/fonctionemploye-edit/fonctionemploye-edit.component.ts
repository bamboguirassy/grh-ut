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
  @Input() set selectedFonction(value){
    this.entity = value;
    this.openModal();
  }
  structures: Structure[] = [];
  selectedStructure: any;
  typeContrats: TypeContrat[] = [];
  selectedTypeContrat: any;
  isModalVisible = false;
  fonctions: Fonction[] = [];
  selectedFonctionId: any;

  constructor(store: Store<IAppState>,
              public fonctionEmployeSrv: FonctionEmployeService,
              public router: Router,  public fonctionSrv: FonctionService,
              private activatedRoute: ActivatedRoute, public structureSrv: StructureService, public typeContratSrv: TypeContratService,
              public location: Location, public datePipe: DatePipe) {
    
  }

  ngOnInit(): void {
    this.selectedTypeContrat = this.entity.typeContrat?.id;
    this.selectedFonctionId = this.entity.fonction?.id;
    this.selectedStructure = this.entity.structure?.id;
    this.entity.datePriseFonction = this.datePipe.transform(this.entity.datePriseFonction, 'yyyy-MM-dd');
    this.entity.dateFin = this.datePipe.transform(this.entity.dateFin, 'yyyy-MM-dd');
    this.findFonctions();
    this.findStructures();
    this.findTypeContrats();
  }

  ngOnDestroy() {

  }

  handlePostLoad() {
   
  }

  prepareUpdate() {
    
  }

  update() {
    this.entity.typeContrat = this.selectedTypeContrat;
    this.entity.fonction = this.selectedFonctionId;
    this.entity.structure = this.selectedStructure; 
    this.entity.dateFin = this.datePipe.transform(this.entity.dateFin, 'yyyy-MM-dd');   
    this.fonctionEmployeSrv.update(this.entity)
      .subscribe((resp: any) => {
        this.closeModal();
        this.modification.emit(resp);
      },(err)=>{
        this.fonctionSrv.httpSrv.catchError(err);
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

  findTypeContrats() {
    return this.typeContratSrv.findAll()
      .subscribe((data: any) => {
        this.typeContrats = data;
      }, err => this.typeContratSrv.httpSrv.catchError(err));
  }


}
