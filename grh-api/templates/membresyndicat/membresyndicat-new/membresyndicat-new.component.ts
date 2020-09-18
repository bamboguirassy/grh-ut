import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { MembreSyndicatService } from '../membresyndicat.service';
import { MembreSyndicat } from '../membresyndicat';
import { Router } from '@angular/router';

@Component({
  selector: 'app-membresyndicat-new',
  templateUrl: './membresyndicat-new.component.html',
  styleUrls: ['./membresyndicat-new.component.scss']
})
export class MembreSyndicatNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: MembreSyndicat;
  @Output() creation: EventEmitter<MembreSyndicat> = new EventEmitter();
  isModalVisible = false;

  constructor(public membreSyndicatSrv: MembreSyndicatService,
    public router: Router) {
    this.entity = new MembreSyndicat();
  }

  ngOnInit(): void {}

  save() {
    this.membreSyndicatSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new MembreSyndicat();
      }, error => this.membreSyndicatSrv.httpSrv.catchError(error));
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

