import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { PaysService } from '../pays.service';
import { Pays } from '../pays';
import { Router } from '@angular/router';

@Component({
  selector: 'app-pays-new',
  templateUrl: './pays-new.component.html',
  styleUrls: ['./pays-new.component.scss']
})
export class PaysNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Pays;
  @Output() creation: EventEmitter<Pays> = new EventEmitter();
  isModalVisible = false;

  constructor(public paySrv: PaysService,
    public router: Router) {
    this.entity = new Pays();
  }

  ngOnInit(): void {}

  save() {
    this.paySrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Pays();
      }, error => this.paySrv.httpSrv.catchError(error));
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

