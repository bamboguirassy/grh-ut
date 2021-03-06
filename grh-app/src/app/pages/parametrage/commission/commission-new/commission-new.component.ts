import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { CommissionService } from '../commission.service';
import { Commission } from '../commission';
import { Router } from '@angular/router';
import { DatePipe } from '@angular/common';
import * as ClassicEditor from '@ckeditor/ckeditor5-build-classic';

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
  public Editor = ClassicEditor;
  constructor(public commissionSrv: CommissionService,
    public router: Router, public datePipe: DatePipe) {
    this.entity = new Commission();
  }

  ngOnInit(): void { }

  save() {
    if (this.entity.dateCreation) {
      this.entity.dateCreation = this.datePipe.transform(this.entity.dateCreation, 'yyyy-MM-dd');
    }
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

