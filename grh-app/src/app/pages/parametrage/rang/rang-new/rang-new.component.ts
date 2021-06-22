import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { RangService } from '../rang.service';
import { Rang } from '../rang';
import { Router } from '@angular/router';

@Component({
  selector: 'app-rang-new',
  templateUrl: './rang-new.component.html',
  styleUrls: ['./rang-new.component.scss']
})
export class RangNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Rang;
  @Output() creation: EventEmitter<Rang> = new EventEmitter();
  isModalVisible = false;

  constructor(public rangSrv: RangService,
    public router: Router) {
    this.entity = new Rang();
  }

  ngOnInit(): void {
    this.entity.etat='true';
  }

  save() {
    this.rangSrv.create(this.entity)
      .subscribe((data: any) => {
        this.creation.emit(data);
        this.entity = new Rang();
        this.entity.etat='true';
      }, error => this.rangSrv.httpSrv.catchError(error));
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

