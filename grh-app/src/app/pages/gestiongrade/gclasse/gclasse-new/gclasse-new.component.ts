import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren, Input } from '@angular/core';
import { GClasseService } from '../gclasse.service';
import { GClasse } from '../gclasse';
import { Router } from '@angular/router';
import { TypeEmploye } from 'src/app/pages/parametrage/typeemploye/typeemploye';
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
  @Input() typeEmploye: TypeEmploye;
  classes: GClasse[] =[];
  selectedClasseId: any;
 
  
  constructor(public gClasseSrv: GClasseService,
    public router: Router) {
    this.entity = new GClasse();
  }

  ngOnInit(): void {
  }

  save() {
    this.entity.suivant = this.selectedClasseId;
    this.entity.typeEmploye = this.typeEmploye.id;
    if (this.typeEmploye) {
      this.entity.typeEmploye = this.typeEmploye.id;
    }
    this.gClasseSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new GClasse();
        this.selectedClasseId=null;
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

  

  

}

