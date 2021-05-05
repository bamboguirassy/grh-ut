import { Component, OnInit, OnDestroy, ViewChild, ViewChildren, EventEmitter, Output, Input, ElementRef } from '@angular/core';
import { Employe } from '../employe';
import { EmployeService } from '../employe.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { DatePipe, Location } from '@angular/common';
import { UploadFileModel } from 'src/app/shared/classes/upload-file-model';
import { TypeEmploye } from 'src/app/pages/parametrage/typeemploye/typeemploye';
import { Pays } from 'src/app/pages/parametrage/pays/pays';
import { CaisseSociale } from 'src/app/pages/parametrage/caissesociale/caissesociale';
import { MutuelleSante } from 'src/app/pages/parametrage/mutuellesante/mutuellesante';
import { Grade } from 'src/app/pages/gestiongrade/grade/grade';
import { PaysService } from 'src/app/pages/parametrage/pays/pays.service';
import { MutuelleSanteService } from 'src/app/pages/parametrage/mutuellesante/mutuellesante.service';
import { CaisseSocialeService } from 'src/app/pages/parametrage/caissesociale/caissesociale.service';
import { GradeService } from 'src/app/pages/gestiongrade/grade/grade.service';

@Component({
  selector: 'app-employe-edit',
  templateUrl: './employe-edit.component.html',
  styleUrls: ['./employe-edit.component.scss']
})
export class EmployeEditComponent extends BasePageComponent<Employe> implements OnInit, OnDestroy {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Employe;
  @Output() creation: EventEmitter<Employe> = new EventEmitter();
  isModalVisible = false;
  currentAvatar: any;
  fileModel: UploadFileModel = new UploadFileModel();
  @Input() typeEmploye: TypeEmploye;
  nationalites: Pays[] = [];
  selectedNationaliteId: any;
  caisseSociales: CaisseSociale[] = [];
  selectedCaisseSocialeId: any;
  mutuelleSantes: MutuelleSante[] = [];
  selectedMutuelleSanteId: any;
  grades: Grade[] = [];
  selectedGradeId: any;

  constructor(store: Store<IAppState>,
              public employeSrv: EmployeService,
              public router: Router,
              public paysSrv: PaysService,
              public mutuelleSanteSrv: MutuelleSanteService,
              public caisseSocialeSrv: CaisseSocialeService,
              private activatedRoute: ActivatedRoute,
              public gradeSrv: GradeService,
              public location: Location,public datePipe: DatePipe) {
    super(store, employeSrv);
    this.pageData = {
      title: 'Modification - Employe',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Employes',
          route: '/'+this.orientation+'/employe'
        },
        {
          title: 'Modification'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findEntity(this.activatedRoute.snapshot.params.id);
  }

  // open modal window
  openModal() {
    this.isModalVisible = true;
  }

  // close modal window
  closeModal() {
    this.isModalVisible = false;
  }

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
  findNationalites() {
    this.paysSrv.findAll()
      .subscribe((data: any) => {
        this.nationalites = data;
      }, err => this.paysSrv.httpSrv.catchError(err));
  }

  findMutuelleSantes() {
    this.mutuelleSanteSrv.findAll()
      .subscribe((data: any) => {
        this.mutuelleSantes = data;
      }, err => this.mutuelleSanteSrv.httpSrv.catchError(err));
  }

  findCaisseSociales() {
    this.caisseSocialeSrv.findAll()
      .subscribe((data: any) => {
        this.caisseSociales = data;
      }, err => this.caisseSocialeSrv.httpSrv.catchError(err));
  }

  findGrades() {
    this.gradeSrv.findAll()
      .subscribe((data: any) => {
        this.grades = data;
      }, err => this.gradeSrv.httpSrv.catchError(err));
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.selectedMutuelleSanteId = this.entity.mutuelleSante?.id;
    this.selectedCaisseSocialeId = this.entity.caisseSociale?.id;
    this.selectedGradeId = this.entity.grade?.id;
    this.selectedNationaliteId = this.entity.nationalite?.id;
    this.entity.dateNaissance = this.datePipe.transform(this.entity.dateNaissance, 'yyyy-MM-dd');
    this.entity.dateRecrutement = this.datePipe.transform(this.entity.dateRecrutement, 'yyyy-MM-dd');
    this.entity.filename = this.fileModel.fileName;
    this.entity.filepath = this.fileModel.fileContent;
    this.findCaisseSociales();
    this.findMutuelleSantes();
    this.findNationalites();
    this.findGrades();
  }

  prepareUpdate() {
    this.entity.caisseSociale = this.selectedCaisseSocialeId;
    this.entity.grade = this.selectedGradeId;
    this.entity.nationalite = this.selectedNationaliteId;
    this.entity.mutuelleSante = this.selectedMutuelleSanteId;
  }

  handlePostUpdate() {
    this.location.back();
  }


}
