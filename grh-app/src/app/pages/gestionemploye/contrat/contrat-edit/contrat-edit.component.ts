import { Component, OnInit, OnDestroy, Output, EventEmitter, Input, ViewChild, ElementRef } from '@angular/core';
import { Contrat } from '../contrat';
import { ContratService } from '../contrat.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';
import { TypeContrat } from 'src/app/pages/parametrage/typecontrat/typecontrat';
import { TypeContratService } from 'src/app/pages/parametrage/typecontrat/typecontrat.service';

@Component({
  selector: 'app-contrat-edit',
  templateUrl: './contrat-edit.component.html',
  styleUrls: ['./contrat-edit.component.scss']
})
export class ContratEditComponent implements OnInit, OnDestroy {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  isModalVisible = false;
  entity: Contrat;
  @Output() modification: EventEmitter<Contrat> = new EventEmitter();
  @Output() onClose: EventEmitter<any> = new EventEmitter();
  typeContrats: TypeContrat[] = [];
  @Input() set selectedContrat(value) {
    this.entity = value;
    this.handlePostLoad();
    this.openModal();
  }
  selectedTypeContrat: any;


  constructor(store: Store<IAppState>,
              public contratSrv: ContratService,
              public typeContratSrv: TypeContratService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
  }

  ngOnInit(): void {
    
    this.findTypeContrats();
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
    this.selectedTypeContrat = this.entity?.typeContrat.id;

  }

  prepareUpdate() {
  }

  handlePostUpdate() {
    this.location.back();
  }

  update() {
    this.entity.typeContrat = this.selectedTypeContrat;
    this.contratSrv.update(this.entity)
      .subscribe((resp: any) => {
        this.closeModal();
        this.modification.emit(resp);
      }, (err) => {
        this.contratSrv.httpSrv.catchError(err);
      });
  }

  findTypeContrats() {
    return this.typeContratSrv.findAll()
      .subscribe((data: any) => {
        this.typeContrats = data;
      }, err => this.typeContratSrv.httpSrv.catchError(err));
  }

}
