import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { SyndicatService } from '../syndicat.service';
import { Syndicat } from '../syndicat';
import { Router } from '@angular/router';

@Component({
  selector: 'app-syndicat-new',
  templateUrl: './syndicat-new.component.html',
  styleUrls: ['./syndicat-new.component.scss']
})
export class SyndicatNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Syndicat;
  @Output() creation: EventEmitter<Syndicat> = new EventEmitter();
  isModalVisible = false;

  constructor(public syndicatSrv: SyndicatService,
    public router: Router) {
    this.entity = new Syndicat();
  }

  ngOnInit(): void {}

  save() {
    this.syndicatSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Syndicat();
      }, error => this.syndicatSrv.httpSrv.catchError(error));
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

