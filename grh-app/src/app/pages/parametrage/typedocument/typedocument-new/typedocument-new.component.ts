import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { TypeDocumentService } from '../typedocument.service';
import { TypeDocument } from '../typedocument';
import { Router } from '@angular/router';

@Component({
  selector: 'app-typedocument-new',
  templateUrl: './typedocument-new.component.html',
  styleUrls: ['./typedocument-new.component.scss']
})
export class TypeDocumentNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: TypeDocument;
  @Output() creation: EventEmitter<TypeDocument> = new EventEmitter();
  isModalVisible = false;

  constructor(public typeDocumentSrv: TypeDocumentService,
    public router: Router) {
    this.entity = new TypeDocument();
  }

  ngOnInit(): void {}

  save() {
    this.typeDocumentSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new TypeDocument();
      }, error => this.typeDocumentSrv.httpSrv.catchError(error));
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

