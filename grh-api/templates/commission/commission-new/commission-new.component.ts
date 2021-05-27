import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { CommissionService } from '../commission.service';
import { Commission } from '../commission';
import { Router } from '@angular/router';

@Component({
  selector: 'app-commission-new',
  templateUrl: './commission-new.component.html',
  styleUrls: ['./commission-new.component.scss']
})
export class CommissionNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Commission;
  @Output() creation: EventEmitter<Commission> = new EventEmitter();
  isModalVisible = false;

  constructor(public commissionSrv: CommissionService,
    public router: Router) {
    this.entity = new Commission();
  }

  ngOnInit(): void {}

  save() {
    this.commissionSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Commission();
      }, error => this.commissionSrv.httpSrv.catchError(error));
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

