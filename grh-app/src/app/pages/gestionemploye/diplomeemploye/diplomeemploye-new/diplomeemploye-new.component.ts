import { Employe } from './../../employe/employe';
import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren, Input } from '@angular/core';
import { DiplomeEmployeService } from '../diplomeemploye.service';
import { DiplomeEmploye } from '../diplomeemploye';
import { Router } from '@angular/router';

@Component({
  selector: 'app-diplomeemploye-new',
  templateUrl: './diplomeemploye-new.component.html',
  styleUrls: ['./diplomeemploye-new.component.scss']
})
export class DiplomeEmployeNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: DiplomeEmploye;
  @Input() employe: Employe
  @Output() creation: EventEmitter<DiplomeEmploye> = new EventEmitter();
  isModalVisible = false;

  constructor(public diplomeEmployeSrv: DiplomeEmployeService,
    public router: Router) {
    this.entity = new DiplomeEmploye();
  }

  ngOnInit(): void {}

  save() {
    this.diplomeEmployeSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new DiplomeEmploye();
      }, error => this.diplomeEmployeSrv.httpSrv.catchError(error));
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

