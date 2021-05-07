import { FonctionEmployeNewComponent } from './gestionemploye/fonctionemploye/fonctionemploye-new/fonctionemploye-new.component';
import { DocumentNewComponent } from './gestionemploye/document/document-new/document-new.component';
import { MembreSyndicatNewComponent } from './gestionemploye/membresyndicat/membresyndicat-new/membresyndicat-new.component';
import { SyndicatNewComponent } from './parametrage/syndicat/syndicat-new/syndicat-new.component';
import { SyndicatShowComponent } from './parametrage/syndicat/syndicat-show/syndicat-show.component';
import { SyndicatEditComponent } from './parametrage/syndicat/syndicat-edit/syndicat-edit.component';
import { SyndicatListComponent } from './parametrage/syndicat/syndicat-list/syndicat-list.component';
import { StructureNewComponent } from './parametrage/structure/structure-new/structure-new.component';
import { StructureShowComponent } from './parametrage/structure/structure-show/structure-show.component';
import { StructureEditComponent } from './parametrage/structure/structure-edit/structure-edit.component';
import { StructureListComponent } from './parametrage/structure/structure-list/structure-list.component';
import { CaisseSocialeShowComponent } from './parametrage/caissesociale/caissesociale-show/caissesociale-show.component';
import { TypeEmployeNewComponent } from './parametrage/typeemploye/typeemploye-new/typeemploye-new.component';
import { TypeEmployeShowComponent } from './parametrage/typeemploye/typeemploye-show/typeemploye-show.component';
import { TypeEmployeEditComponent } from './parametrage/typeemploye/typeemploye-edit/typeemploye-edit.component';
import { TypeEmployeListComponent } from './parametrage/typeemploye/typeemploye-list/typeemploye-list.component';
import { PaysNewComponent } from './parametrage/pays/pays-new/pays-new.component';
import { PaysShowComponent } from './parametrage/pays/pays-show/pays-show.component';
import { PaysEditComponent } from './parametrage/pays/pays-edit/pays-edit.component';
import { PaysListComponent } from './parametrage/pays/pays-list/pays-list.component';
import { MutuelleSanteNewComponent } from './parametrage/mutuellesante/mutuellesante-new/mutuellesante-new.component';
import { MutuelleSanteShowComponent } from './parametrage/mutuellesante/mutuellesante-show/mutuellesante-show.component';
import { MutuelleSanteEditComponent } from './parametrage/mutuellesante/mutuellesante-edit/mutuellesante-edit.component';
import { MutuelleSanteListComponent } from './parametrage/mutuellesante/mutuellesante-list/mutuellesante-list.component';
import { FonctionNewComponent } from './parametrage/fonction/fonction-new/fonction-new.component';
import { FonctionShowComponent } from './parametrage/fonction/fonction-show/fonction-show.component';
import { FonctionEditComponent } from './parametrage/fonction/fonction-edit/fonction-edit.component';
import { FonctionListComponent } from './parametrage/fonction/fonction-list/fonction-list.component';
import { ProfessionListComponent } from './parametrage/profession/profession-list/profession-list.component';
import { ProfessionShowComponent } from './parametrage/profession/profession-show/profession-show.component';
import { ProfessionEditComponent } from './parametrage/profession/profession-edit/profession-edit.component';
import { ProfessionCloneComponent } from './parametrage/profession/profession-clone/profession-clone.component';
import { ProfessionNewComponent } from './parametrage/profession/profession-new/profession-new.component';
import { CaisseSocialeNewComponent } from './parametrage/caissesociale/caissesociale-new/caissesociale-new.component';
import { CaisseSocialeEditComponent } from './parametrage/caissesociale/caissesociale-edit/caissesociale-edit.component';
import { CaisseSocialeListComponent } from './parametrage/caissesociale/caissesociale-list/caissesociale-list.component';
import { TypeDocumentNewComponent } from './parametrage/typedocument/typedocument-new/typedocument-new.component';
import { TypeDocumentShowComponent } from './parametrage/typedocument/typedocument-show/typedocument-show.component';
import { TypeDocumentEditComponent } from './parametrage/typedocument/typedocument-edit/typedocument-edit.component';
import { TypeDocumentListComponent } from './parametrage/typedocument/typedocument-list/typedocument-list.component';
import { TypeContratNewComponent } from './parametrage/typecontrat/typecontrat-new/typecontrat-new.component';
import { TypeContratShowComponent } from './parametrage/typecontrat/typecontrat-show/typecontrat-show.component';
import { TypeContratEditComponent } from './parametrage/typecontrat/typecontrat-edit/typecontrat-edit.component';
import { TypeContratListComponent } from './parametrage/typecontrat/typecontrat-list/typecontrat-list.component';
import { TypeEntiteNewComponent } from './parametrage/typeentite/typeentite-new/typeentite-new.component';
import { PageEditAccountComponent } from './apps/service-pages/edit-account/edit-account.component';
import { UserShowComponent } from './parametrage/user/user-show/user-show.component';
import { UserEditComponent } from './parametrage/user/user-edit/user-edit.component';
import { GroupNewComponent } from './parametrage/group/group-new/group-new.component';
import { GroupListComponent } from './parametrage/group/group-list/group-list.component';
import { GroupEditComponent } from './parametrage/group/group-edit/group-edit.component';
import { SharedModule } from './../shared/shared.module';
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
import { NzDatePickerModule, NzDividerModule, NzTableModule, NzAvatarModule, NzButtonModule, NzCardModule, NzCarouselModule, NzCollapseModule, NzDescriptionsModule, NzDropDownModule, NzEmptyModule, NzFormModule, NzGridModule, NzIconModule, NzInputModule, NzListModule, NzModalModule, NzPopconfirmModule, NzSelectModule, NzSpinModule, NzStatisticModule, NzTabsModule, NzTypographyModule, NzUploadModule } from 'ng-zorro-antd';

import { environment } from '../../environments/environment';
import { UIModule } from '../ui/ui.module';
import { LayoutModule } from '../layout/layout.module';
import { BasePageComponent } from './base-page';

import { PageDashboardComponent } from './dashboards/dashboard-1';

import { PageUserProfileComponent } from './apps/service-pages/user-profile';
import { PageSignInComponent } from './apps/sessions/sign-in';
import { PageSignUpComponent } from './apps/sessions/sign-up';
import { PageSettingsComponent } from './settings';
import { Page404Component } from './apps/sessions/page-404';
import { Page500Component } from './apps/sessions/page-500';
import { DragDropModule } from '@angular/cdk/drag-drop';
import { UserListComponent } from './parametrage/user/user-list/user-list.component';
import { UserNewComponent } from './parametrage/user/user-new/user-new.component';
import { GroupShowComponent } from './parametrage/group/group-show/group-show.component';
import { TypeEntiteEditComponent } from './parametrage/typeentite/typeentite-edit/typeentite-edit.component';
import { TypeEntiteListComponent } from './parametrage/typeentite/typeentite-list/typeentite-list.component';
import { TypeEntiteShowComponent } from './parametrage/typeentite/typeentite-show/typeentite-show.component';
import { EmployeEditComponent } from './gestionemploye/employe/employe-edit/employe-edit.component';
import { EmployeListComponent } from './gestionemploye/employe/employe-list/employe-list.component';
import { EmployeShowComponent } from './gestionemploye/employe/employe-show/employe-show.component';
import { EmployeNewComponent } from './gestionemploye/employe/employe-new/employe-new.component';
import { GradeEditComponent } from './gestiongrade/grade/grade-edit/grade-edit.component';
import { GradeListComponent } from './gestiongrade/grade/grade-list/grade-list.component';
import { GradeShowComponent } from './gestiongrade/grade/grade-show/grade-show.component';
import { GradeNewComponent } from './gestiongrade/grade/grade-new/grade-new.component';
import { EchelonClasseListComponent } from './gestiongrade/echelonclasse/echelonclasse-list/echelonclasse-list.component';
import { EchelonClasseShowComponent } from './gestiongrade/echelonclasse/echelonclasse-show/echelonclasse-show.component';
import { EchelonClasseEditComponent } from './gestiongrade/echelonclasse/echelonclasse-edit/echelonclasse-edit.component';
import { EchelonClasseCloneComponent } from './gestiongrade/echelonclasse/echelonclasse-clone/echelonclasse-clone.component';
import { EchelonClasseNewComponent } from './gestiongrade/echelonclasse/echelonclasse-new/echelonclasse-new.component';
import { GCategorieListComponent } from './gestiongrade/gcategorie/gcategorie-list/gcategorie-list.component';
import { GCategorieShowComponent } from './gestiongrade/gcategorie/gcategorie-show/gcategorie-show.component';
import { GCategorieEditComponent } from './gestiongrade/gcategorie/gcategorie-edit/gcategorie-edit.component';
import { GCategorieCloneComponent } from './gestiongrade/gcategorie/gcategorie-clone/gcategorie-clone.component';
import { GCategorieNewComponent } from './gestiongrade/gcategorie/gcategorie-new/gcategorie-new.component';
import { GClasseListComponent } from './gestiongrade/gclasse/gclasse-list/gclasse-list.component';
import { GClasseShowComponent } from './gestiongrade/gclasse/gclasse-show/gclasse-show.component';
import { GClasseEditComponent } from './gestiongrade/gclasse/gclasse-edit/gclasse-edit.component';
import { GClasseNewComponent } from './gestiongrade/gclasse/gclasse-new/gclasse-new.component';
import { GEchelonListComponent } from './gestiongrade/gechelon/gechelon-list/gechelon-list.component';
import { GEchelonShowComponent } from './gestiongrade/gechelon/gechelon-show/gechelon-show.component';
import { GEchelonEditComponent } from './gestiongrade/gechelon/gechelon-edit/gechelon-edit.component';
import { GEchelonCloneComponent } from './gestiongrade/gechelon/gechelon-clone/gechelon-clone.component';
import { GEchelonNewComponent } from './gestiongrade/gechelon/gechelon-new/gechelon-new.component';
import { GNiveauListComponent } from './gestiongrade/gniveau/gniveau-list/gniveau-list.component';
import { GNiveauShowComponent } from './gestiongrade/gniveau/gniveau-show/gniveau-show.component';
import { GNiveauEditComponent } from './gestiongrade/gniveau/gniveau-edit/gniveau-edit.component';
import { GNiveauCloneComponent } from './gestiongrade/gniveau/gniveau-clone/gniveau-clone.component';
import { GNiveauNewComponent } from './gestiongrade/gniveau/gniveau-new/gniveau-new.component';


import { AdresseCloneComponent } from './gestionemploye/adresse/adresse-clone/adresse-clone.component';
import { AdresseEditComponent } from './gestionemploye/adresse/adresse-edit/adresse-edit.component';
import { AdresseListComponent } from './gestionemploye/adresse/adresse-list/adresse-list.component';
import { AdresseNewComponent } from './gestionemploye/adresse/adresse-new/adresse-new.component';
import { AdresseShowComponent } from './gestionemploye/adresse/adresse-show/adresse-show.component';
import { MembreFamilleCloneComponent } from './gestionemploye/membrefamille/membrefamille-clone/membrefamille-clone.component';
import { MembreFamilleEditComponent } from './gestionemploye/membrefamille/membrefamille-edit/membrefamille-edit.component';
import { MembreFamilleListComponent } from './gestionemploye/membrefamille/membrefamille-list/membrefamille-list.component';
import { MembreFamilleNewComponent } from './gestionemploye/membrefamille/membrefamille-new/membrefamille-new.component';
import { MembreFamilleShowComponent } from './gestionemploye/membrefamille/membrefamille-show/membrefamille-show.component';
import { MembreSyndicatCloneComponent } from './gestionemploye/membresyndicat/membresyndicat-clone/membresyndicat-clone.component';
import { MembreSyndicatEditComponent } from './gestionemploye/membresyndicat/membresyndicat-edit/membresyndicat-edit.component';
import { MembreSyndicatListComponent } from './gestionemploye/membresyndicat/membresyndicat-list/membresyndicat-list.component';
import { MembreSyndicatShowComponent } from './gestionemploye/membresyndicat/membresyndicat-show/membresyndicat-show.component';
import { DocumentCloneComponent } from './gestionemploye/document/document-clone/document-clone.component';
import { DocumentEditComponent } from './gestionemploye/document/document-edit/document-edit.component';
import { DocumentListComponent } from './gestionemploye/document/document-list/document-list.component';
import { DocumentShowComponent } from './gestionemploye/document/document-show/document-show.component';
import { FonctionEmployeCloneComponent } from './gestionemploye/fonctionemploye/fonctionemploye-clone/fonctionemploye-clone.component';
import { FonctionEmployeEditComponent } from './gestionemploye/fonctionemploye/fonctionemploye-edit/fonctionemploye-edit.component';
import { FonctionEmployeListComponent } from './gestionemploye/fonctionemploye/fonctionemploye-list/fonctionemploye-list.component';
import { FonctionEmployeShowComponent } from './gestionemploye/fonctionemploye/fonctionemploye-show/fonctionemploye-show.component';

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
    NzAvatarModule,
    NzButtonModule,
    NzCardModule,
    NzCarouselModule,
    NzCollapseModule,
    NzDatePickerModule,
    NzDescriptionsModule,
    NzDividerModule,
    NzDropDownModule,
    NzEmptyModule,
    NzFormModule,
    NzGridModule,
    NzIconModule,
    NzInputModule,
    NzListModule,
    NzModalModule,
    NzPopconfirmModule,
    NzSelectModule,
    NzSpinModule,
    NzStatisticModule,
    NzTableModule,
    NzTabsModule,
    NzTypographyModule,
    NzUploadModule,
    UIModule,
    LayoutModule,

    SharedModule
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
    // grade components
    GradeListComponent,
    GradeEditComponent,
    GradeShowComponent,
    GradeNewComponent,
    // employe components
    EmployeListComponent,
    EmployeEditComponent,
    EmployeShowComponent,
    EmployeNewComponent,
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
    GCategorieCloneComponent,
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
    GEchelonCloneComponent,
    GEchelonNewComponent,
    // gniveau components
    GNiveauListComponent,
    GNiveauEditComponent,
    GNiveauShowComponent,
    GNiveauCloneComponent,
    GNiveauNewComponent,
    // profession components
    ProfessionListComponent,
    ProfessionEditComponent,
    ProfessionShowComponent,
    ProfessionCloneComponent,
    ProfessionNewComponent,
    // echelonclasse components
    EchelonClasseListComponent,
    EchelonClasseEditComponent,
    EchelonClasseShowComponent,
    EchelonClasseCloneComponent,
    EchelonClasseNewComponent,
  ],
  exports: [],
  entryComponents: []
})
export class PagesModule { }
