import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
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

  constructor(public affectationSrv: AffectationService,
    public router: Router) {
    this.entity = new Affectation();
  }

  ngOnInit(): void {}

  save() {
    this.affectationSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Affectation();
      }, error => this.affectationSrv.httpSrv.catchError(error));
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

