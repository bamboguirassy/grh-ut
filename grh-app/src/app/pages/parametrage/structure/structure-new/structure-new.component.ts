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
  structureParentes: Structure[] = [];
  selectedStructureParente: Structure;

  constructor(public structureSrv: StructureService,
    public router: Router
    ) {
    this.entity = new Structure();
  }

  ngOnInit(): void {
    this.findStructureParentes();
  }

  save() {
    if(this.selectedStructureParente) {
      this.entity.structureParente = this.selectedStructureParente.id;
    }
    this.structureSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Structure();
        this.findStructureParentes();
        this.selectedStructureParente = null;
      }, error => this.structureSrv.httpSrv.catchError(error));
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

