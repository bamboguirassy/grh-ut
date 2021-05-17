import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { TypeEntiteService } from '../typeentite.service';
import { TypeEntite } from '../typeentite';
import { Router } from '@angular/router';

@Component({
  selector: 'app-typeentite-new',
  templateUrl: './typeentite-new.component.html',
  styleUrls: ['./typeentite-new.component.scss']
})
export class TypeEntiteNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: TypeEntite;
  @Output() creation: EventEmitter<TypeEntite> = new EventEmitter();
  isModalVisible = false;

  constructor(public typeEntiteSrv: TypeEntiteService,
    public router: Router) {
    this.entity = new TypeEntite();
  }

  ngOnInit(): void {}

  save() {
    this.typeEntiteSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new TypeEntite();
      }, error => this.typeEntiteSrv.httpSrv.catchError(error));
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

