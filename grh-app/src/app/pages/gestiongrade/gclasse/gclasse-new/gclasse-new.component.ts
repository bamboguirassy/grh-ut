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
  selectedClasse: GClasse;
  typeEmployes: TypeEmploye[] =[];
  selectedTypeEmploye: TypeEmploye;
  

  constructor(public gClasseSrv: GClasseService,
    public router: Router,
    public classeServive : GClasseService,
    public typeEmployeServive : TypeEmployeService) {
    this.entity = new GClasse();
  }

  ngOnInit(): void {
    this.findClasses();
    this.findTypeEmployes();
  }

  save() {
    if (this.selectedClasse) {
      this.classes = this.selectedClasse.id;
    }
    if (this.selectedTypeEmploye) {
      this.typeEmployes = this.selectedTypeEmploye.id;
    }
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
    this.classeServive.findAll()
      .subscribe((data: any) => {
        this.classes = data;
      }, err => this.classeServive.httpSrv.catchError(err));
  }

   findTypeEmployes() {
    this.typeEmployeServive.findAll()
      .subscribe((data: any) => {
        this.typeEmployes = data;
      }, err => this.typeEmployeServive.httpSrv.catchError(err));
  }

  

}

