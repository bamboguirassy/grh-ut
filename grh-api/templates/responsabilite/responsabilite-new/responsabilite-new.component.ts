import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { ResponsabiliteService } from '../responsabilite.service';
import { Responsabilite } from '../responsabilite';
import { Router } from '@angular/router';

@Component({
  selector: 'app-responsabilite-new',
  templateUrl: './responsabilite-new.component.html',
  styleUrls: ['./responsabilite-new.component.scss']
})
export class ResponsabiliteNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Responsabilite;
  @Output() creation: EventEmitter<Responsabilite> = new EventEmitter();
  isModalVisible = false;

  constructor(public responsabiliteSrv: ResponsabiliteService,
    public router: Router) {
    this.entity = new Responsabilite();
  }

  ngOnInit(): void {}

  save() {
    this.responsabiliteSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Responsabilite();
      }, error => this.responsabiliteSrv.httpSrv.catchError(error));
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

