import { TypeDocumentService } from './../../../parametrage/typedocument/typedocument.service';
import { Employe } from './../../employe/employe';
import { UploadFileModel } from './../../../../shared/classes/upload-file-model';
import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren, Input } from '@angular/core';
import { DocumentService } from '../document.service';
import { Document } from '../document';
import { Router } from '@angular/router';
import { TypeDocument } from 'src/app/pages/parametrage/typedocument/typedocument';

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
  currentAvatar: any;
  fileModel: UploadFileModel = new UploadFileModel();
  @Input() employe: Employe;
  typeDocuments: TypeDocument[] = [];
  selectedTypeDocument: TypeDocument;

  constructor(public documentSrv: DocumentService,
    public router: Router, public typeDocumentSrv: TypeDocumentService) {
    this.entity = new Document();
  }

  ngOnInit(): void {
    this.findTypeDocuments();
  }

  save() {
    this.entity.filename = this.fileModel.fileName;
    this.entity.filepath = this.fileModel.fileContent;
    this.entity.employe = this.employe.id;
    this.entity.typeDocument = this.selectedTypeDocument.id;
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

  // upload new file
  onFileChanged(inputValue: any) {
    let file: File = inputValue.target.files[0];
    let reader: FileReader = new FileReader();
    reader.onloadend = () => {
      this.currentAvatar = reader.result;
      this.fileModel.fileName = file.name.split('.')[0];
      this.fileModel.fileContent = this.currentAvatar.split(',')[1];
    };
    reader.readAsDataURL(file);
  }

  findTypeDocuments() {
    this.typeDocumentSrv.findAll()
      .subscribe((data: any) => {
        this.typeDocuments = data;
      }, err => this.typeDocumentSrv.httpSrv.catchError(err));
  }

}

