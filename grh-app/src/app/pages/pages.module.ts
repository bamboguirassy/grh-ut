import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';

import { ChartsModule } from 'ng2-charts';
import { NgxChartsModule } from '@swimlane/ngx-charts';
import { NgxEchartsModule } from 'ngx-echarts';
import * as echarts from 'echarts';
import { AgmCoreModule } from '@agm/core';
import { LeafletModule } from '@asymmetrik/ngx-leaflet';
import { FullCalendarModule } from '@fullcalendar/angular';
import { NzDatePickerModule } from 'ng-zorro-antd/date-picker';
import { NzDividerModule } from 'ng-zorro-antd/divider';
import { NzTableModule } from 'ng-zorro-antd/table';

import { environment } from '../../environments/environment';
import { UIModule } from '../ui/ui.module';
import { LayoutModule } from '../layout/layout.module';
import { BasePageComponent } from './base-page';

import { PageDashboardComponent } from './dashboards/dashboard-1';
import { PageUserProfileComponent } from './apps/service-pages/user-profile';
import { PageEditAccountComponent } from './apps/service-pages/edit-account';
import { PageSignInComponent } from './apps/sessions/sign-in';
import { PageSignUpComponent } from './apps/sessions/sign-up';
import { PageSettingsComponent } from './settings';
import { Page404Component } from './apps/sessions/page-404';
import { Page500Component } from './apps/sessions/page-500';
import { DragDropModule } from '@angular/cdk/drag-drop';

import { NzAvatarModule } from 'ng-zorro-antd/avatar';
import { NzButtonModule } from 'ng-zorro-antd/button';
import { NzCardModule } from 'ng-zorro-antd/card';
import { NzDropDownModule } from 'ng-zorro-antd/dropdown';
import { NzEmptyModule } from 'ng-zorro-antd/empty';
import { NzFormModule } from 'ng-zorro-antd/form';
import { NzInputModule } from 'ng-zorro-antd/input';
import { NzCarouselModule } from 'ng-zorro-antd/carousel';
import { NzCollapseModule } from 'ng-zorro-antd/collapse';
import { NzDescriptionsModule } from 'ng-zorro-antd/descriptions';
import { NzGridModule } from 'ng-zorro-antd/grid';
import { NzListModule } from 'ng-zorro-antd/list';
import { NzModalModule } from 'ng-zorro-antd/modal';
import { NzStepsModule } from 'ng-zorro-antd/steps';
import { NzPopconfirmModule } from 'ng-zorro-antd/popconfirm';
import { NzSelectModule } from 'ng-zorro-antd/select';
import { NzTabsModule } from 'ng-zorro-antd/tabs';
import { NzToolTipModule } from 'ng-zorro-antd/tooltip';

import { SharedModule } from '../shared/shared.module';
import { NgxOrgChartModule } from 'ngx-org-chart';
import { RecrutementGenreComponent } from './dashboards/recrutement/recrutement-genre/recrutement-genre.component';
import { RecrutementTypeComponent } from './dashboards/recrutement/recrutement-type/recrutement-type.component';
import { AdresseCloneComponent } from './gestionemploye/adresse/adresse-clone/adresse-clone.component';
import { AdresseEditComponent } from './gestionemploye/adresse/adresse-edit/adresse-edit.component';
import { AdresseListComponent } from './gestionemploye/adresse/adresse-list/adresse-list.component';
import { AdresseNewComponent } from './gestionemploye/adresse/adresse-new/adresse-new.component';
import { AdresseShowComponent } from './gestionemploye/adresse/adresse-show/adresse-show.component';
import { ContratEditComponent } from './gestionemploye/contrat/contrat-edit/contrat-edit.component';
import { ContratListComponent } from './gestionemploye/contrat/contrat-list/contrat-list.component';
import { ContratNewComponent } from './gestionemploye/contrat/contrat-new/contrat-new.component';
import { ContratShowComponent } from './gestionemploye/contrat/contrat-show/contrat-show.component';
import { DiplomeEmployeEditComponent } from './gestionemploye/diplomeemploye/diplomeemploye-edit/diplomeemploye-edit.component';
import { DiplomeEmployeListComponent } from './gestionemploye/diplomeemploye/diplomeemploye-list/diplomeemploye-list.component';
import { DiplomeEmployeNewComponent } from './gestionemploye/diplomeemploye/diplomeemploye-new/diplomeemploye-new.component';
import { DocumentCloneComponent } from './gestionemploye/document/document-clone/document-clone.component';
import { DocumentEditComponent } from './gestionemploye/document/document-edit/document-edit.component';
import { DocumentListComponent } from './gestionemploye/document/document-list/document-list.component';
import { DocumentNewComponent } from './gestionemploye/document/document-new/document-new.component';
import { DocumentShowComponent } from './gestionemploye/document/document-show/document-show.component';
import { EmployeEditComponent } from './gestionemploye/employe/employe-edit/employe-edit.component';
import { EmployeListComponent } from './gestionemploye/employe/employe-list/employe-list.component';
import { EmployeNewComponent } from './gestionemploye/employe/employe-new/employe-new.component';
import { EmployeShowComponent } from './gestionemploye/employe/employe-show/employe-show.component';
import { FonctionEmployeCloneComponent } from './gestionemploye/fonctionemploye/fonctionemploye-clone/fonctionemploye-clone.component';
import { FonctionEmployeEditComponent } from './gestionemploye/fonctionemploye/fonctionemploye-edit/fonctionemploye-edit.component';
import { FonctionEmployeListComponent } from './gestionemploye/fonctionemploye/fonctionemploye-list/fonctionemploye-list.component';
import { FonctionEmployeNewComponent } from './gestionemploye/fonctionemploye/fonctionemploye-new/fonctionemploye-new.component';
import { FonctionEmployeShowComponent } from './gestionemploye/fonctionemploye/fonctionemploye-show/fonctionemploye-show.component';
import { MembreFamilleCloneComponent } from './gestionemploye/membrefamille/membrefamille-clone/membrefamille-clone.component';
import { MembreFamilleEditComponent } from './gestionemploye/membrefamille/membrefamille-edit/membrefamille-edit.component';
import { MembreFamilleListComponent } from './gestionemploye/membrefamille/membrefamille-list/membrefamille-list.component';
import { MembreFamilleNewComponent } from './gestionemploye/membrefamille/membrefamille-new/membrefamille-new.component';
import { MembreFamilleShowComponent } from './gestionemploye/membrefamille/membrefamille-show/membrefamille-show.component';
import { MembreSyndicatCloneComponent } from './gestionemploye/membresyndicat/membresyndicat-clone/membresyndicat-clone.component';
import { MembreSyndicatEditComponent } from './gestionemploye/membresyndicat/membresyndicat-edit/membresyndicat-edit.component';
import { MembreSyndicatListComponent } from './gestionemploye/membresyndicat/membresyndicat-list/membresyndicat-list.component';
import { MembreSyndicatNewComponent } from './gestionemploye/membresyndicat/membresyndicat-new/membresyndicat-new.component';
import { MembreSyndicatShowComponent } from './gestionemploye/membresyndicat/membresyndicat-show/membresyndicat-show.component';
import { GCategorieEditComponent } from './gestiongrade/gcategorie/gcategorie-edit/gcategorie-edit.component';
import { GCategorieListComponent } from './gestiongrade/gcategorie/gcategorie-list/gcategorie-list.component';
import { GCategorieNewComponent } from './gestiongrade/gcategorie/gcategorie-new/gcategorie-new.component';
import { GCategorieShowComponent } from './gestiongrade/gcategorie/gcategorie-show/gcategorie-show.component';
import { GClasseEditComponent } from './gestiongrade/gclasse/gclasse-edit/gclasse-edit.component';
import { GClasseListComponent } from './gestiongrade/gclasse/gclasse-list/gclasse-list.component';
import { GClasseNewComponent } from './gestiongrade/gclasse/gclasse-new/gclasse-new.component';
import { GClasseShowComponent } from './gestiongrade/gclasse/gclasse-show/gclasse-show.component';
import { GEchelonEditComponent } from './gestiongrade/gechelon/gechelon-edit/gechelon-edit.component';
import { GEchelonListComponent } from './gestiongrade/gechelon/gechelon-list/gechelon-list.component';
import { GEchelonNewComponent } from './gestiongrade/gechelon/gechelon-new/gechelon-new.component';
import { GEchelonShowComponent } from './gestiongrade/gechelon/gechelon-show/gechelon-show.component';
import { GNiveauEditComponent } from './gestiongrade/gniveau/gniveau-edit/gniveau-edit.component';
import { GNiveauListComponent } from './gestiongrade/gniveau/gniveau-list/gniveau-list.component';
import { GNiveauNewComponent } from './gestiongrade/gniveau/gniveau-new/gniveau-new.component';
import { GNiveauShowComponent } from './gestiongrade/gniveau/gniveau-show/gniveau-show.component';
import { CaisseSocialeEditComponent } from './parametrage/caissesociale/caissesociale-edit/caissesociale-edit.component';
import { CaisseSocialeListComponent } from './parametrage/caissesociale/caissesociale-list/caissesociale-list.component';
import { CaisseSocialeNewComponent } from './parametrage/caissesociale/caissesociale-new/caissesociale-new.component';
import { CaisseSocialeShowComponent } from './parametrage/caissesociale/caissesociale-show/caissesociale-show.component';
import { DiplomeEditComponent } from './parametrage/diplome/diplome-edit/diplome-edit.component';
import { DiplomeListComponent } from './parametrage/diplome/diplome-list/diplome-list.component';
import { DiplomeNewComponent } from './parametrage/diplome/diplome-new/diplome-new.component';
import { DiplomeShowComponent } from './parametrage/diplome/diplome-show/diplome-show.component';
import { FonctionEditComponent } from './parametrage/fonction/fonction-edit/fonction-edit.component';
import { FonctionListComponent } from './parametrage/fonction/fonction-list/fonction-list.component';
import { FonctionNewComponent } from './parametrage/fonction/fonction-new/fonction-new.component';
import { FonctionShowComponent } from './parametrage/fonction/fonction-show/fonction-show.component';
import { GroupEditComponent } from './parametrage/group/group-edit/group-edit.component';
import { GroupListComponent } from './parametrage/group/group-list/group-list.component';
import { GroupNewComponent } from './parametrage/group/group-new/group-new.component';
import { GroupShowComponent } from './parametrage/group/group-show/group-show.component';
import { MutuelleSanteEditComponent } from './parametrage/mutuellesante/mutuellesante-edit/mutuellesante-edit.component';
import { MutuelleSanteListComponent } from './parametrage/mutuellesante/mutuellesante-list/mutuellesante-list.component';
import { MutuelleSanteNewComponent } from './parametrage/mutuellesante/mutuellesante-new/mutuellesante-new.component';
import { MutuelleSanteShowComponent } from './parametrage/mutuellesante/mutuellesante-show/mutuellesante-show.component';
import { OrganigrammeViewComponent } from './parametrage/organigramme/organigramme-view/organigramme-view.component';
import { PaysEditComponent } from './parametrage/pays/pays-edit/pays-edit.component';
import { PaysListComponent } from './parametrage/pays/pays-list/pays-list.component';
import { PaysNewComponent } from './parametrage/pays/pays-new/pays-new.component';
import { PaysShowComponent } from './parametrage/pays/pays-show/pays-show.component';
import { ProfessionEditComponent } from './parametrage/profession/profession-edit/profession-edit.component';
import { ProfessionListComponent } from './parametrage/profession/profession-list/profession-list.component';
import { ProfessionNewComponent } from './parametrage/profession/profession-new/profession-new.component';
import { ProfessionShowComponent } from './parametrage/profession/profession-show/profession-show.component';
import { StructureEditComponent } from './parametrage/structure/structure-edit/structure-edit.component';
import { StructureListComponent } from './parametrage/structure/structure-list/structure-list.component';
import { StructureNewComponent } from './parametrage/structure/structure-new/structure-new.component';
import { StructureShowComponent } from './parametrage/structure/structure-show/structure-show.component';
import { StructureFonctionListComponent } from './parametrage/structurefonction/structurefonction-list/structurefonction-list.component';
import { StructureFonctionNewComponent } from './parametrage/structurefonction/structurefonction-new/structurefonction-new.component';
import { SyndicatEditComponent } from './parametrage/syndicat/syndicat-edit/syndicat-edit.component';
import { SyndicatListComponent } from './parametrage/syndicat/syndicat-list/syndicat-list.component';
import { SyndicatNewComponent } from './parametrage/syndicat/syndicat-new/syndicat-new.component';
import { SyndicatShowComponent } from './parametrage/syndicat/syndicat-show/syndicat-show.component';
import { TypeContratEditComponent } from './parametrage/typecontrat/typecontrat-edit/typecontrat-edit.component';
import { TypeContratListComponent } from './parametrage/typecontrat/typecontrat-list/typecontrat-list.component';
import { TypeContratNewComponent } from './parametrage/typecontrat/typecontrat-new/typecontrat-new.component';
import { TypeContratShowComponent } from './parametrage/typecontrat/typecontrat-show/typecontrat-show.component';
import { TypeDocumentEditComponent } from './parametrage/typedocument/typedocument-edit/typedocument-edit.component';
import { TypeDocumentListComponent } from './parametrage/typedocument/typedocument-list/typedocument-list.component';
import { TypeDocumentNewComponent } from './parametrage/typedocument/typedocument-new/typedocument-new.component';
import { TypeDocumentShowComponent } from './parametrage/typedocument/typedocument-show/typedocument-show.component';
import { TypeEmployeEditComponent } from './parametrage/typeemploye/typeemploye-edit/typeemploye-edit.component';
import { TypeEmployeListComponent } from './parametrage/typeemploye/typeemploye-list/typeemploye-list.component';
import { TypeEmployeNewComponent } from './parametrage/typeemploye/typeemploye-new/typeemploye-new.component';
import { TypeEmployeShowComponent } from './parametrage/typeemploye/typeemploye-show/typeemploye-show.component';
import { TypeEntiteEditComponent } from './parametrage/typeentite/typeentite-edit/typeentite-edit.component';
import { TypeEntiteListComponent } from './parametrage/typeentite/typeentite-list/typeentite-list.component';
import { TypeEntiteNewComponent } from './parametrage/typeentite/typeentite-new/typeentite-new.component';
import { TypeEntiteShowComponent } from './parametrage/typeentite/typeentite-show/typeentite-show.component';
import { UserEditComponent } from './parametrage/user/user-edit/user-edit.component';
import { UserListComponent } from './parametrage/user/user-list/user-list.component';
import { UserNewComponent } from './parametrage/user/user-new/user-new.component';
import { UserShowComponent } from './parametrage/user/user-show/user-show.component';
import { NgPipesModule } from 'ng-pipes';
import { GradeManagerComponent } from './gestiongrade/grade/grade-manager/grade-manager.component';
import { NzRadioModule } from 'ng-zorro-antd/radio';
import { DiplomeEmployeTimelineComponent } from './gestionemploye/diplomeemploye/diplomeemploye-timeline/diplomeemploye-timeline.component';
import { AffectationListComponent } from './gestionemploye/affectation/affectation-list/affectation-list.component';
import { AffectationEditComponent } from './gestionemploye/affectation/affectation-edit/affectation-edit.component';
import { AffectationNewComponent } from './gestionemploye/affectation/affectation-new/affectation-new.component';
import { ContratTimelineComponent } from './gestionemploye/contrat/contrat-timeline/contrat-timeline.component';
import { GradeEmployeGlobalComponent } from './dashboards/grade/grade-employe-global/grade-employe-global.component';
import { TestComponent } from './tests/test/test.component';
import { ProfessionStatsComponent } from './dashboards/profession/profession-stats/profession-stats.component';
import { StructureStatsComponent } from './dashboards/structure/structure-stats/structure-stats.component';
import { TypeEmployeStatsComponent } from './dashboards/typeemploye/type-employe-stats/type-employe-stats.component';
import { RecrutementRangeStatsComponent } from './dashboards/recrutement/recrutement-range/recrutement-range-stats/recrutement-range-stats.component';
import { EntreeSortieStatsComponent } from './dashboards/recrutement/entree-sortie-stats/entree-sortie-stats.component';
import { DemissionEmployeProfessionAnneeStatsComponent } from './dashboards/recrutement/demission-employe-profession-annee-stats/demission-employe-profession-annee-stats.component';
import { DemissionEmployeStructureAnneeStatsComponent } from './dashboards/recrutement/demission-employe-structure-annee-stats/demission-employe-structure-annee-stats.component';
import { TypeContratStatsComponent } from './dashboards/typecontrat/type-contrat-stats/type-contrat-stats.component';
import { TypeContratActifStatsComponent } from './dashboards/typecontrat/type-contrat-actif-stats/type-contrat-actif-stats.component';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { RecrutementPeriodStatsComponent } from './dashboards/recrutement/recrutement-period/recrutement-period-stats/recrutement-period-stats.component';
import { AncienneteEmployeComponent } from './dashboards/anciennete/anciennete-employe/anciennete-employe.component';
import { RecrutementStatsViewMainComponent } from './dashboards/recrutement/recrutement-stats-view-main/recrutement-stats-view-main.component';
import { GradeStatsViewMainComponent } from './dashboards/grade/grade-stats-view-main/grade-stats-view-main.component';
import { EmployeStatsViewMainComponent } from './dashboards/typeemploye/employe-stats-view-main/employe-stats-view-main.component';
import { AffectationTimelineComponent } from './gestionemploye/affectation/affectation-timeline/affectation-timeline.component';
import { DiplomeStatsComponent } from './dashboards/diplome/diplome-stats/diplome-stats.component';
import { EmployeGlobalComponent } from './gestionemploye/employe/employe-global/employe-global.component';
import { ContratEnExpirationComponent } from './gestionemploye/contrat/contrat-en-expiration/contrat-en-expiration.component';
import { DiplomeMainDashboardComponent } from './dashboards/diplome/diplome-main-dashboard/diplome-main-dashboard.component';
import { CommissionListComponent } from './parametrage/commission/commission-list/commission-list.component';
import { CommissionEditComponent } from './parametrage/commission/commission-edit/commission-edit.component';
import { CommissionShowComponent } from './parametrage/commission/commission-show/commission-show.component';
import { CommissionNewComponent } from './parametrage/commission/commission-new/commission-new.component';



@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    RouterModule,

    ChartsModule,
    NgxChartsModule,
    NgxEchartsModule.forRoot({
      echarts: { init: echarts.init }
    }),
    AgmCoreModule.forRoot({
      apiKey: environment.googleMapApiKey
    }),
    LeafletModule,
    FullCalendarModule,
    NzDatePickerModule,
    NzDividerModule,
    NzTableModule,
    DragDropModule,

    UIModule,
    LayoutModule,


    NzAvatarModule,
    NzButtonModule,
    NzCardModule,
    NzCarouselModule,
    NzCollapseModule,
    NzDatePickerModule,
    NzDividerModule,
    NzDropDownModule,
    NzEmptyModule,
    NzFormModule,
    NzGridModule,
    NzDescriptionsModule,
    NzInputModule,
    NzListModule,
    NzModalModule,
    NzStepsModule,
    NzPopconfirmModule,
    NzSelectModule,
    NzTableModule,
    NzTabsModule,
    UIModule,
    LayoutModule,
    SharedModule,
    NgxOrgChartModule,
    // imports all pipes module
    NgPipesModule,
    NzRadioModule,
    NzIconModule,
    NzToolTipModule

  ],
  declarations: [
    BasePageComponent,
    PageDashboardComponent,
    PageUserProfileComponent,
    PageEditAccountComponent,
    PageSignInComponent,
    PageSignUpComponent,
    PageSettingsComponent,
    Page404Component,
    Page500Component,


    UserListComponent,
    UserEditComponent,
    UserShowComponent,
    UserNewComponent,
    GroupEditComponent,
    GroupShowComponent,
    GroupListComponent,
    GroupNewComponent,
    // typeentite components
    TypeEntiteListComponent,
    TypeEntiteEditComponent,
    TypeEntiteShowComponent,
    TypeEntiteNewComponent,
    // typecontrat components
    TypeContratListComponent,
    TypeContratEditComponent,
    TypeContratShowComponent,
    TypeContratNewComponent,
    ContratTimelineComponent,
    // typedocument components
    TypeDocumentListComponent,
    TypeDocumentEditComponent,
    TypeDocumentShowComponent,
    TypeDocumentNewComponent,

    // caissesociale components
    CaisseSocialeListComponent,
    CaisseSocialeEditComponent,
    CaisseSocialeShowComponent,
    CaisseSocialeNewComponent,
    // fonction components
    FonctionListComponent,
    FonctionEditComponent,
    FonctionShowComponent,
    FonctionNewComponent,
    // mutuellesante components
    MutuelleSanteListComponent,
    MutuelleSanteEditComponent,
    MutuelleSanteShowComponent,
    MutuelleSanteNewComponent,
    // pays components
    PaysListComponent,
    PaysEditComponent,
    PaysShowComponent,
    PaysNewComponent,
    // typeemploye components
    TypeEmployeListComponent,
    TypeEmployeEditComponent,
    TypeEmployeShowComponent,
    TypeEmployeNewComponent,
    // structure components
    StructureListComponent,
    StructureEditComponent,
    StructureShowComponent,
    StructureNewComponent,
    // syndicat components
    SyndicatListComponent,
    SyndicatEditComponent,
    SyndicatShowComponent,
    SyndicatNewComponent,
    // employe components
    EmployeListComponent,
    EmployeEditComponent,
    EmployeShowComponent,
    EmployeNewComponent,
    // commission components
    CommissionListComponent,
    CommissionEditComponent,
    CommissionShowComponent,
    CommissionNewComponent,
    // adresse components
    AdresseListComponent,
    AdresseEditComponent,
    AdresseShowComponent,
    AdresseCloneComponent,
    AdresseNewComponent,
    // membrefamille components
    MembreFamilleListComponent,
    MembreFamilleEditComponent,
    MembreFamilleShowComponent,
    MembreFamilleCloneComponent,
    MembreFamilleNewComponent,
    // membresyndicat components
    MembreSyndicatListComponent,
    MembreSyndicatEditComponent,
    MembreSyndicatShowComponent,
    MembreSyndicatCloneComponent,
    MembreSyndicatNewComponent,
    // document components
    DocumentListComponent,
    DocumentEditComponent,
    DocumentShowComponent,
    DocumentCloneComponent,
    DocumentNewComponent,
    // fonctionemploye components
    FonctionEmployeListComponent,
    FonctionEmployeEditComponent,
    FonctionEmployeShowComponent,
    FonctionEmployeCloneComponent,
    FonctionEmployeNewComponent,
    // gcategorie components
    GCategorieListComponent,
    GCategorieEditComponent,
    GCategorieShowComponent,
    GCategorieNewComponent,
    // gclasse components
    GClasseListComponent,
    GClasseEditComponent,
    GClasseShowComponent,
    GClasseNewComponent,
    // gechelon components
    GEchelonListComponent,
    GEchelonEditComponent,
    GEchelonShowComponent,
    GEchelonNewComponent,
    // gniveau components
    GNiveauListComponent,
    GNiveauEditComponent,
    GNiveauShowComponent,
    GNiveauNewComponent,
    // profession components
    ProfessionListComponent,
    ProfessionEditComponent,
    ProfessionShowComponent,
    ProfessionNewComponent,
    // echelonclasse components
    RecrutementGenreComponent,
    RecrutementTypeComponent,

    // diplome components
    DiplomeListComponent,
    DiplomeEditComponent,
    DiplomeShowComponent,
    DiplomeNewComponent,

    // diplomeemploye components
    DiplomeEmployeListComponent,
    DiplomeEmployeNewComponent,
    DiplomeEmployeEditComponent,

    // contrat components
    ContratListComponent,
    ContratEditComponent,
    ContratShowComponent,
    ContratNewComponent,

    //organigramme
    OrganigrammeViewComponent,

    //structure fonction
    StructureFonctionListComponent,
    StructureFonctionNewComponent,
    GradeManagerComponent,
    DiplomeEmployeTimelineComponent,

    // affectation components
    AffectationListComponent,
    AffectationEditComponent,
    AffectationNewComponent,
    GradeEmployeGlobalComponent,
    TestComponent,
    ProfessionStatsComponent,
    StructureStatsComponent,
    TypeEmployeStatsComponent,
    RecrutementRangeStatsComponent,
    EntreeSortieStatsComponent,
    DemissionEmployeProfessionAnneeStatsComponent,
    DemissionEmployeStructureAnneeStatsComponent,
    RecrutementPeriodStatsComponent,
    TypeContratStatsComponent,
    TypeContratActifStatsComponent,
    AncienneteEmployeComponent,
    RecrutementStatsViewMainComponent,
    GradeStatsViewMainComponent,
    EmployeStatsViewMainComponent,
    AffectationTimelineComponent,
    DiplomeStatsComponent,
    EmployeGlobalComponent,
    ContratEnExpirationComponent,
    DiplomeMainDashboardComponent,

  ],
  exports: [],
  entryComponents: []
})
export class PagesModule { }
