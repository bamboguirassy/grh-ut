import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { DiplomeService } from '../diplome.service';
import { Diplome } from '../diplome';
import { Router } from '@angular/router';

@Component({
  selector: 'app-diplome-new',
  templateUrl: './diplome-new.component.html',
  styleUrls: ['./diplome-new.component.scss']
})
export class DiplomeNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Diplome;
  @Output() creation: EventEmitter<Diplome> = new EventEmitter();
  isModalVisible = false;

  constructor(public diplomeSrv: DiplomeService,
    public router: Router) {
    this.entity = new Diplome();
  }

  ngOnInit(): void {}

  save() {
    this.diplomeSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Diplome();
      }, error => this.diplomeSrv.httpSrv.catchError(error));
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

