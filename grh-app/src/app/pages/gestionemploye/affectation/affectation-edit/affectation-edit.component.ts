import { StructureService } from './../../../parametrage/structure/structure.service';
import { Structure } from './../../../parametrage/structure/structure';
import { Component, OnInit, OnDestroy, Output, EventEmitter, Input, ViewChild, ElementRef } from '@angular/core';
import { Affectation } from '../affectation';
import { AffectationService } from '../affectation.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-affectation-edit',
  templateUrl: './affectation-edit.component.html',
  styleUrls: ['./affectation-edit.component.scss']
})
export class AffectationEditComponent implements OnInit, OnDestroy {
  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  isModalVisible = false;
  entity: Affectation;
  @Output() modification: EventEmitter<Affectation> = new EventEmitter();
  @Output() onClose: EventEmitter<any> = new EventEmitter();
  structures: Structure[] = [];
  selectedStructureId: any;
  @Input() set selectedAffectation(value) {
    this.entity = value;
    this.handlePostLoad();
    this.openModal();
  }
  selectedStructure: Structure;
  constructor(store: Store<IAppState>,
              public affectationSrv: AffectationService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location, public structureSrv: StructureService) {

              }
    

  ngOnInit(): void {
    this.findStructures();
  }

  ngOnDestroy() {
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

  handlePostLoad() {
    this.selectedStructureId = this.entity?.structure.id;
  }

  prepareUpdate() {
  }

  handlePostUpdate() {
    this.location.back();
  }

  update() {
    this.entity.structure = this.selectedStructureId;
    this.affectationSrv.update(this.entity)
      .subscribe((resp: any) => {
        this.closeModal();
        this.modification.emit(resp);
      }, (err) => {
        this.affectationSrv.httpSrv.catchError(err);
      });
  }

  findStructures() {
    return this.structureSrv.findAll()
      .subscribe((data: any) => {
        this.structures = data;
      }, err => this.structureSrv.httpSrv.catchError(err));
  }


}
