import { TypeEmploye } from './../../typeemploye/typeemploye';
import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren, Input } from '@angular/core';
import { SyndicatService } from '../syndicat.service';
import { Syndicat } from '../syndicat';
import { Router } from '@angular/router';
import { UploadFileModel } from 'src/app/shared/classes/upload-file-model';

@Component({
  selector: 'app-syndicat-new',
  templateUrl: './syndicat-new.component.html',
  styleUrls: ['./syndicat-new.component.scss']
})
export class SyndicatNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Syndicat;
  @Output() creation: EventEmitter<Syndicat> = new EventEmitter();
  isModalVisible = false;
  @Input() typeEmploye: TypeEmploye;
  currentAvatar: any;
  fileModel: UploadFileModel = new UploadFileModel();

  constructor(public syndicatSrv: SyndicatService,
    public router: Router) {
    this.entity = new Syndicat();
    
  }

  ngOnInit(): void {    
  }

  save() {
    this.entity.typeEmploye = this.typeEmploye.id;
    this.entity.filename = this.fileModel.fileName;
    this.entity.filepath = this.fileModel.fileContent;
    this.syndicatSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Syndicat();
      }, error => this.syndicatSrv.httpSrv.catchError(error));
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

}

