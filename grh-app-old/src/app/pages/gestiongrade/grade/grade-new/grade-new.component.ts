import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { GradeService } from '../grade.service';
import { Grade } from '../grade';
import { Router } from '@angular/router';

@Component({
  selector: 'app-grade-new',
  templateUrl: './grade-new.component.html',
  styleUrls: ['./grade-new.component.scss']
})
export class GradeNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Grade;
  @Output() creation: EventEmitter<Grade> = new EventEmitter();
  isModalVisible = false;

  constructor(public gradeSrv: GradeService,
    public router: Router) {
    this.entity = new Grade();
  }

  ngOnInit(): void {}

  save() {
    this.gradeSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Grade();
      }, error => this.gradeSrv.httpSrv.catchError(error));
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

