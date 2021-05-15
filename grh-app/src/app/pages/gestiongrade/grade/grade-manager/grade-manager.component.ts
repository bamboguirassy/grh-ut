import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { TypeEmploye } from 'src/app/pages/parametrage/typeemploye/typeemploye';
import { TypeEmployeService } from 'src/app/pages/parametrage/typeemploye/typeemploye.service';
import { GCategorie } from '../../gcategorie/gcategorie';
import { GCategorieService } from '../../gcategorie/gcategorie.service';
import { GClasse } from '../../gclasse/gclasse';
import { GClasseService } from '../../gclasse/gclasse.service';
import { GEchelon } from '../../gechelon/gechelon';
import { GEchelonService } from '../../gechelon/gechelon.service';
import { GNiveau } from '../../gniveau/gniveau';
import { GNiveauService } from '../../gniveau/gniveau.service';
import { Grade } from '../grade';
import { GradeService } from '../grade.service';

@Component({
  selector: 'app-grade-manager',
  templateUrl: './grade-manager.component.html',
  styleUrls: ['./grade-manager.component.scss']
})
export class GradeManagerComponent extends BasePageComponent<Grade> implements OnInit {

  typeEmployes: TypeEmploye[] = [];
  classes: GClasse[] = [];
  categories: GCategorie[] = [];
  niveaux: GNiveau[] = [];
  echelons: GEchelon[] = [];
  selectedTypeEmploye: TypeEmploye;
  selectedClasse: GClasse;
  gradeMap: any;
  isClasseEditing = false;
  isClasseModelChanged = false;
  selectedCategorieIds = [];
  selectedNiveauIds = [];

  constructor(store: Store<IAppState>,
    public gradeSrv: GradeService,
    public typeEmployeSrv: TypeEmployeService,
    public gClasseSrv: GClasseService,
    public gCategorieSrv: GCategorieService,
    public gNiveauSrv: GNiveauService,
    public gEchelonSrv: GEchelonService) {
    super(store, gradeSrv);

    this.pageData = {
      title: 'Gestion des grades',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Gestion des grades'
        }
      ]
    };
  }

  ngOnInit(): void {
    this.findTypeEmployes();
    this.findEchelons();
  }

  findTypeEmployes() {
    this.typeEmployeSrv.findAll()
      .subscribe((data: any) => {
        this.typeEmployes = data;
        this.setLoaded();
      }, err => this.typeEmployeSrv.httpSrv.catchError(err));
  }

  findClassesByTypeEmploye(typeEmploye: TypeEmploye) {
    this.gClasseSrv.findByTypeEmploye(typeEmploye)
      .subscribe((data: any) => {
        this.classes = data;
      }, err => this.gClasseSrv.httpSrv.catchError(err));
  }

  findCategories() {
    this.gCategorieSrv.findAll()
      .subscribe((data: any) => {
        this.categories = data;
      }, err => this.gCategorieSrv.httpSrv.catchError(err));
  }

  findNiveaux() {
    this.gNiveauSrv.findAll()
      .subscribe((data: any) => {
        this.niveaux = data;
      }, err => this.gNiveauSrv.httpSrv.catchError(err));
  }

  findEchelons() {
    this.gEchelonSrv.findAll()
      .subscribe((data: any) => {
        this.echelons = data;
      }, err => this.gEchelonSrv.httpSrv.catchError(err));
  }

  loadGradeMap(classe: GClasse) {
    this.gradeSrv.mapByClasse(classe)
      .subscribe((data: any) => {
        this.gradeMap = data;
      }, err => this.gradeSrv.httpSrv.catchError(err));
  }

  startClasseEdit() {
    this.isClasseEditing = true;
  }

  cancelClasseEdit() {
    this.isClasseEditing = false;
    this.isClasseModelChanged = false;
  }

  updateClasse() {
    this.selectedClasse.categories = this.selectedCategorieIds;
    this.selectedClasse.niveaux = this.selectedNiveauIds;
    this.gClasseSrv.update(this.selectedClasse)
      .subscribe(() => {
        this.isClasseModelChanged = false;
        this.cancelClasseEdit();
        this.loadGradeMap(this.selectedClasse);
        this.findClassesByTypeEmploye(this.selectedClasse.typeEmploye);
      }, err => this.gClasseSrv.httpSrv.catchError(err));
  }

  updateClasseModel(data: any) {
    this.isClasseModelChanged = true;
  }

  handleClasseChange(selectedClasse: GClasse) {
    this.selectedCategorieIds = selectedClasse.categories?.map(cat => cat.id);
    this.selectedNiveauIds = selectedClasse.niveaux?.map(niv => niv.id);
    this.loadGradeMap(selectedClasse);
  }

  enabledEdit(item) {
    item.editEnabled = true;
    item.selectedEchelons = item.grades?.map(grade => grade.echelon.id);
  }

  disableEdit(item) {
    item.editEnabled = false;
  }

  updateGrades(niveau, tabCategorieItem) {
    let categorieId = tabCategorieItem.categorie.id;
    let selectedEchelonIds = tabCategorieItem.selectedEchelons;
    this.gradeSrv.createBatch({ niveau, categorieId, selectedEchelonIds, selectedClasseId: this.selectedClasse.id })
      .subscribe(data => {
        this.disableEdit(tabCategorieItem);
        tabCategorieItem.grades = data;
      }, err => this.gradeSrv.httpSrv.catchError(err));
  }

}
