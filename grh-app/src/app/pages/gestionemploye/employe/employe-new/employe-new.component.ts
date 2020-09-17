import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { EmployeService } from '../employe.service';
import { Employe } from '../employe';
import { Router } from '@angular/router';
import { UploadFileModel } from 'src/app/shared/classes/upload-file-model';

@Component({
  selector: 'app-employe-new',
  templateUrl: './employe-new.component.html',
  styleUrls: ['./employe-new.component.scss']
})
export class EmployeNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Employe;
  @Output() creation: EventEmitter<Employe> = new EventEmitter();
  isModalVisible = false;
  currentAvatar: any;
  fileModel: UploadFileModel = new UploadFileModel();

  constructor(public employeSrv: EmployeService,
    public router: Router) {
    this.entity = new Employe();
  }

  ngOnInit(): void {}

  save() {
    this.employeSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Employe();
      }, error => this.employeSrv.httpSrv.catchError(error));
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

