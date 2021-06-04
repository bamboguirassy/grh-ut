import { Component, OnInit, OnDestroy, ViewChild, ViewChildren, ElementRef, Input, Output, EventEmitter } from '@angular/core';
import { FonctionEmploye } from '../fonctionemploye';
import { FonctionEmployeService } from '../fonctionemploye.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location, DatePipe } from '@angular/common';

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
  @Input() set selectedFonction(value) {
    this.entity = value;
    this.handlePostLoad();
    this.openModal();
  }
  isModalVisible = false;

  constructor(store: Store<IAppState>,
    public fonctionEmployeSrv: FonctionEmployeService,
    public router: Router,
    private activatedRoute: ActivatedRoute,
    public location: Location, public datePipe: DatePipe) {

  }

  ngOnInit(): void {

  }

  ngOnDestroy() {

  }

  handlePostLoad() {
  }

  prepareUpdate() {

  }

  update() {
    this.entity.dateFin = this.datePipe.transform(this.entity.dateFin, 'yyyy-MM-dd');
    if (this.entity.etat && !this.entity.responsabilite.duree) {
      this.entity.dateFin = null;
    }
    this.entity.datePriseFonction = this.datePipe.transform(this.entity.datePriseFonction, 'yyyy-MM-dd');
    this.fonctionEmployeSrv.update(this.entity)
      .subscribe((resp: any) => {
        this.closeModal();
        this.modification.emit(resp);
      }, (err) => {
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




}
