import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { TypeContratService } from '../typecontrat.service';
import { TypeContrat } from '../typecontrat';
import { Router } from '@angular/router';

@Component({
  selector: 'app-typecontrat-new',
  templateUrl: './typecontrat-new.component.html',
  styleUrls: ['./typecontrat-new.component.scss']
})
export class TypeContratNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: TypeContrat;
  @Output() creation: EventEmitter<TypeContrat> = new EventEmitter();
  isModalVisible = false;

  constructor(public typeContratSrv: TypeContratService,
    public router: Router) {
    this.entity = new TypeContrat();
  }

  ngOnInit(): void {}

  save() {
    this.typeContratSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new TypeContrat();
      }, error => this.typeContratSrv.httpSrv.catchError(error));
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

