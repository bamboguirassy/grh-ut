import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { DocumentService } from '../document.service';
import { Document } from '../document';
import { Router } from '@angular/router';

@Component({
  selector: 'app-document-new',
  templateUrl: './document-new.component.html',
  styleUrls: ['./document-new.component.scss']
})
export class DocumentNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Document;
  @Output() creation: EventEmitter<Document> = new EventEmitter();
  isModalVisible = false;

  constructor(public documentSrv: DocumentService,
    public router: Router) {
    this.entity = new Document();
  }

  ngOnInit(): void {}

  save() {
    this.documentSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Document();
      }, error => this.documentSrv.httpSrv.catchError(error));
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
