import { GradeService } from './../../../gestiongrade/grade/grade.service';
import { CaisseSocialeService } from './../../../parametrage/caissesociale/caissesociale.service';
import { MutuelleSanteService } from './../../../parametrage/mutuellesante/mutuellesante.service';
import { PaysService } from './../../../parametrage/pays/pays.service';
import { Grade } from './../../../gestiongrade/grade/grade';
import { MutuelleSante } from './../../../parametrage/mutuellesante/mutuellesante';
import { CaisseSociale } from './../../../parametrage/caissesociale/caissesociale';
import { Pays } from './../../../parametrage/pays/pays';
import { TypeEmploye } from './../../../parametrage/typeemploye/typeemploye';
import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren, Input } from '@angular/core';
import { EmployeService } from '../employe.service';
import { Employe } from '../employe';
import { Router } from '@angular/router';
import { UploadFileModel } from 'src/app/shared/classes/upload-file-model';
import { DatePipe } from '@angular/common';
import { StructureService } from 'src/app/pages/parametrage/structure/structure.service';
import { Structure } from 'src/app/pages/parametrage/structure/structure';
import { Profession } from 'src/app/pages/parametrage/profession/profession';
import { ProfessionService } from 'src/app/pages/parametrage/profession/profession.service';

@Component({
  selector: 'app-employe-new, nz-demo-steps-step-next',
  templateUrl: './employe-new.component.html',
  styleUrls: ['./employe-new.component.scss']
 
})
export class EmployeNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Employe;
  @Output() creation: EventEmitter<Employe> = new EventEmitter();
  isModalVisible = false;
  currentAvatar: any;
  fileModel: UploadFileModel = new UploadFileModel();
  @Input() typeEmploye: TypeEmploye;
  nationalites: Pays[] = [];
  selectedNationalite: Pays;
  caisseSociales: CaisseSociale[] = [];
  selectedCaisseSociale: CaisseSociale;
  mutuelleSantes: MutuelleSante[] = [];
  selectedMutuelleSante: MutuelleSante;
  indices: Grade[] = [];
  structures: Structure[] = [];
  selectedStructure: Structure;
  selectedIndice: Grade;
  professions: Profession[] = [];
  selectedProfession: Profession;
  areDataLoaded = false;
  layout='horizontal'
  current = 0;
  pre(): void {
    this.current -= 1;
  }
  next(): void {
    this.current += 1;
  }
  
  constructor(public employeSrv: EmployeService,
    public router: Router, public paysSrv: PaysService,
    public mutuelleSanteSrv: MutuelleSanteService,
    public caisseSocialeSrv: CaisseSocialeService,
    public professionSrv: ProfessionService,
    public gradeSrv: GradeService, public structureSrv: StructureService, public datePipe: DatePipe) {
    this.initNewEmploye();
  }

  ngOnInit(): void { }

  initNewEmploye() {
    this.entity = new Employe();
    this.entity.etat = true;
  }
 

  save() {

    if (this.selectedCaisseSociale) {
      this.entity.caisseSociale = this.selectedCaisseSociale.id;
    }
    if (this.selectedMutuelleSante) {
      this.entity.mutuelleSante = this.selectedMutuelleSante.id;
    }
    if (this.selectedIndice) {
      this.entity.indice = this.selectedIndice.id;
    }
    if(this.selectedStructure) {
      this.entity.structure = this.selectedStructure.id;
    }
    if(this.selectedProfession) {
    this.entity.profession = this.selectedProfession.id;
    }
    if (this.selectedNationalite) {
      this.entity.nationalite = this.selectedNationalite.id;
    }
    if (this.typeEmploye) {
      this.entity.typeEmploye = this.typeEmploye.id;
    }
    this.entity.dateNaissance = this.datePipe.transform(this.entity.dateNaissance, 'yyyy-MM-dd');
    this.entity.dateRecrutement = this.datePipe.transform(this.entity.dateRecrutement, 'yyyy-MM-dd');
    this.entity.datePriseService = this.datePipe.transform(this.entity.datePriseService, 'yyyy-MM-dd');
    if (this.entity.dateSortie) {
      this.entity.dateSortie = this.datePipe.transform(this.entity.dateSortie, 'yyyy-MM-dd');
    }
    if (this.entity.etat) {
      this.entity.dateSortie = null;
      this.entity.motifSortie = null;
      this.entity.commentaireSortie = null;
    }
    this.entity.filename = this.fileModel.fileName;
    this.entity.filepath = this.fileModel.fileContent;
    this.employeSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.initNewEmploye();
        this.router.navigate(['/' + this.layout + '/' + this.employeSrv.getRoutePrefix() + data.id]);
      }, error => this.employeSrv.httpSrv.catchError(error));
  }


  // open modal window
  openModal() {
    this.isModalVisible = true;
    if (!this.areDataLoaded) {
      this.findNationalites();
      this.findCaisseSociales();
      this.findMutuelleSantes();
      this.findIndices();
      this.findStructures();
      this.areDataLoaded = true;
    }
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

  findIndices() {
    this.gradeSrv.findByTypeEmploye(this.typeEmploye)
      .subscribe((data: any) => {
        this.indices = data;
      }, err => this.gradeSrv.httpSrv.catchError(err));
  }

  findStructures() {
    this.structureSrv.findAll()
      .subscribe((data: any) => {
        this.structures = data;

      }, err => this.structureSrv.httpSrv.catchError(err));
  }

  findProfessions() {
    this.professionSrv.findAll()
      .subscribe((data: any) => {
        this.professions = data;
      }, err => this.professionSrv.httpSrv.catchError(err));
  }

  

}

