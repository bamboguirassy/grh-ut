import { TypeEntiteService } from './../../typeentite/typeentite.service';
import { TypeEntite } from './../../typeentite/typeentite';
import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { StructureService } from '../structure.service';
import { Structure } from '../structure';
import { Router } from '@angular/router';

@Component({
  selector: 'app-structure-new',
  templateUrl: './structure-new.component.html',
  styleUrls: ['./structure-new.component.scss']
})
export class StructureNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Structure;
  @Output() creation: EventEmitter<Structure> = new EventEmitter();
  isModalVisible = false;
  typeEntites: TypeEntite[] = [];
  structureParentes: Structure[] = [];
  selectedStructureParente: Structure;
  selectedTypeEntite: TypeEntite;

  constructor(public structureSrv: StructureService,
    public router: Router,
    public typeEntiteSrv: TypeEntiteService) {
    this.entity = new Structure();
  }

  ngOnInit(): void {
    this.findTypeEntites();
    this.findStructureParentes();
  }

  save() {
    if(this.selectedStructureParente) {
      this.entity.structureParente = this.selectedStructureParente.id;
    }
    this.entity.typeEntite = this.selectedTypeEntite.id;
    this.structureSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Structure();
        this.findStructureParentes();
        this.selectedTypeEntite = null;
        this.selectedStructureParente = null;
      }, error => this.structureSrv.httpSrv.catchError(error));
  }

  findTypeEntites() {
    this.typeEntiteSrv.findAll()
    .subscribe((data: any)=>{
      this.typeEntites = data;
    })
  }

  findStructureParentes() {
    this.structureSrv.findAll()
    .subscribe((data: any)=>{
      this.structureParentes = data;
    })
  }

  // open modal window
  openModal() {
    this.isModalVisible = true;
  }

  // close modal window
  closeModal() {
    this.isModalVisible = false;
  }

}

