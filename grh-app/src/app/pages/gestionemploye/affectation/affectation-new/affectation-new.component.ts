import { DatePipe } from '@angular/common';
import { StructureService } from './../../../parametrage/structure/structure.service';
import { Structure } from './../../../parametrage/structure/structure';
import { Employe } from './../../employe/employe';
import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren, Input } from '@angular/core';
import { AffectationService } from '../affectation.service';
import { Affectation } from '../affectation';
import { Router } from '@angular/router';

@Component({
  selector: 'app-affectation-new',
  templateUrl: './affectation-new.component.html',
  styleUrls: ['./affectation-new.component.scss']
})
export class AffectationNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Affectation;
  @Output() creation: EventEmitter<Affectation> = new EventEmitter();
  isModalVisible = false;

  @Input() employe: Employe;
  structures: Structure[] = [];
  selectedStructure: any;

  constructor(public affectationSrv: AffectationService,
    public router: Router, public structureSrv: StructureService, public datePipe: DatePipe) {
    this.entity = new Affectation();
  }

  ngOnInit(): void { }

  save() {
    this.entity.employe = this.employe.id;
    if (this.selectedStructure) {
      this.entity.structure = this.selectedStructure.id;
    }
    if (this.entity.date) {
      this.entity.date = this.datePipe.transform(this.entity.date, 'yyyy-MM-dd');
    }

    this.affectationSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data)
        this.selectedStructure = null;
        this.entity = new Affectation();
      }, error => this.affectationSrv.httpSrv.catchError(error));
  }

  // open modal window
  openModal() {
    this.isModalVisible = true;
    this.findStructures();
  }

  // close modal window
  closeModal() {
    this.isModalVisible = false;
  }

  findStructures() {
    this.structureSrv.findAll()
      .subscribe((data: any) => {
        this.structures = data;
      }, err => this.structureSrv.httpSrv.catchError(err));
  }

}

