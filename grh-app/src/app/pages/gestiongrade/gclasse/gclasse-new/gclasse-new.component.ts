import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { GClasseService } from '../gclasse.service';
import { GClasse } from '../gclasse';
import { Router } from '@angular/router';
import { TypeEmploye } from 'src/app/pages/parametrage/typeemploye/typeemploye';
import { TypeEmployeService } from 'src/app/pages/parametrage/typeemploye/typeemploye.service';
import { UploadFileModel } from 'src/app/shared/classes/upload-file-model';


@Component({
  selector: 'app-gclasse-new',
  templateUrl: './gclasse-new.component.html',
  styleUrls: ['./gclasse-new.component.scss']
})
export class GClasseNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: GClasse;
  @Output() creation: EventEmitter<GClasse> = new EventEmitter();
  isModalVisible = false;
  currentAvatar: any;
  fileModel: UploadFileModel = new UploadFileModel();


  classes: GClasse[] =[];
  selectedClasseId: any;
  typeEmployes: TypeEmploye[] =[];
  selectedTypeEmployeId: any;
  

  constructor(public gClasseSrv: GClasseService,
    public router: Router,
    public typeEmployeServive : TypeEmployeService) {
    this.entity = new GClasse();
  }

  ngOnInit(): void {
    this.findTypeEmployes();
  }

  save() {
    this.entity.suivant = this.selectedClasseId;
    this.entity.typeEmploye = this.selectedTypeEmployeId;
    this.gClasseSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new GClasse();
      }, error => this.gClasseSrv.httpSrv.catchError(error));
  }

  // open modal window
  openModal() {
    this.isModalVisible = true;
  }

  // close modal window
  closeModal() {
    this.isModalVisible = false;
  }

   findClasses() {
    this.gClasseSrv.findAll()
      .subscribe((data: any) => {
        this.classes = data;
      }, err => this.gClasseSrv.httpSrv.catchError(err));
  }

   findTypeEmployes() {
    this.typeEmployeServive.findAll()
      .subscribe((data: any) => {
        this.typeEmployes = data;
      }, err => this.typeEmployeServive.httpSrv.catchError(err));
  }

  

}

