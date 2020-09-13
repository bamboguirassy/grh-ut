import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { TypeEmployeService } from '../typeemploye.service';
import { TypeEmploye } from '../typeemploye';
import { Router } from '@angular/router';

@Component({
  selector: 'app-typeemploye-new',
  templateUrl: './typeemploye-new.component.html',
  styleUrls: ['./typeemploye-new.component.scss']
})
export class TypeEmployeNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: TypeEmploye;
  @Output() creation: EventEmitter<TypeEmploye> = new EventEmitter();
  isModalVisible = false;

  constructor(public typeEmployeSrv: TypeEmployeService,
    public router: Router) {
    this.entity = new TypeEmploye();
  }

  ngOnInit(): void {}

  save() {
    this.typeEmployeSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new TypeEmploye();
      }, error => this.typeEmployeSrv.httpSrv.catchError(error));
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

