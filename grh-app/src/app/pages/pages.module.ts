import { SyndicatNewComponent } from './parametrage/syndicat/syndicat-new/syndicat-new.component';
import { SyndicatCloneComponent } from './parametrage/syndicat/syndicat-clone/syndicat-clone.component';
import { SyndicatShowComponent } from './parametrage/syndicat/syndicat-show/syndicat-show.component';
import { SyndicatEditComponent } from './parametrage/syndicat/syndicat-edit/syndicat-edit.component';
import { SyndicatListComponent } from './parametrage/syndicat/syndicat-list/syndicat-list.component';
import { StructureNewComponent } from './parametrage/structure/structure-new/structure-new.component';
import { StructureCloneComponent } from './parametrage/structure/structure-clone/structure-clone.component';
import { StructureShowComponent } from './parametrage/structure/structure-show/structure-show.component';
import { StructureEditComponent } from './parametrage/structure/structure-edit/structure-edit.component';
import { StructureListComponent } from './parametrage/structure/structure-list/structure-list.component';
import { CaisseSocialeShowComponent } from './parametrage/caissesociale/caissesociale-show/caissesociale-show.component';
import { TypeEmployeNewComponent } from './parametrage/typeemploye/typeemploye-new/typeemploye-new.component';
import { TypeEmployeCloneComponent } from './parametrage/typeemploye/typeemploye-clone/typeemploye-clone.component';
import { TypeEmployeShowComponent } from './parametrage/typeemploye/typeemploye-show/typeemploye-show.component';
import { TypeEmployeEditComponent } from './parametrage/typeemploye/typeemploye-edit/typeemploye-edit.component';
import { TypeEmployeListComponent } from './parametrage/typeemploye/typeemploye-list/typeemploye-list.component';
import { PaysNewComponent } from './parametrage/pays/pays-new/pays-new.component';
import { PaysCloneComponent } from './parametrage/pays/pays-clone/pays-clone.component';
import { PaysShowComponent } from './parametrage/pays/pays-show/pays-show.component';
import { PaysEditComponent } from './parametrage/pays/pays-edit/pays-edit.component';
import { PaysListComponent } from './parametrage/pays/pays-list/pays-list.component';
import { MutuelleSanteNewComponent } from './parametrage/mutuellesante/mutuellesante-new/mutuellesante-new.component';
import { MutuelleSanteCloneComponent } from './parametrage/mutuellesante/mutuellesante-clone/mutuellesante-clone.component';
import { MutuelleSanteShowComponent } from './parametrage/mutuellesante/mutuellesante-show/mutuellesante-show.component';
import { MutuelleSanteEditComponent } from './parametrage/mutuellesante/mutuellesante-edit/mutuellesante-edit.component';
import { MutuelleSanteListComponent } from './parametrage/mutuellesante/mutuellesante-list/mutuellesante-list.component';
import { FonctionNewComponent } from './parametrage/fonction/fonction-new/fonction-new.component';
import { FonctionCloneComponent } from './parametrage/fonction/fonction-clone/fonction-clone.component';
import { FonctionShowComponent } from './parametrage/fonction/fonction-show/fonction-show.component';
import { FonctionEditComponent } from './parametrage/fonction/fonction-edit/fonction-edit.component';
import { FonctionListComponent } from './parametrage/fonction/fonction-list/fonction-list.component';
import { CaisseSocialeNewComponent } from './parametrage/caissesociale/caissesociale-new/caissesociale-new.component';
import { CaisseSocialeCloneComponent } from './parametrage/caissesociale/caissesociale-clone/caissesociale-clone.component';
import { CaisseSocialeEditComponent } from './parametrage/caissesociale/caissesociale-edit/caissesociale-edit.component';
import { CaisseSocialeListComponent } from './parametrage/caissesociale/caissesociale-list/caissesociale-list.component';
import { TypeDocumentNewComponent } from './parametrage/typedocument/typedocument-new/typedocument-new.component';
import { TypeDocumentCloneComponent } from './parametrage/typedocument/typedocument-clone/typedocument-clone.component';
import { TypeDocumentShowComponent } from './parametrage/typedocument/typedocument-show/typedocument-show.component';
import { TypeDocumentEditComponent } from './parametrage/typedocument/typedocument-edit/typedocument-edit.component';
import { TypeDocumentListComponent } from './parametrage/typedocument/typedocument-list/typedocument-list.component';
import { TypeContratNewComponent } from './parametrage/typecontrat/typecontrat-new/typecontrat-new.component';
import { TypeContratCloneComponent } from './parametrage/typecontrat/typecontrat-clone/typecontrat-clone.component';
import { TypeContratShowComponent } from './parametrage/typecontrat/typecontrat-show/typecontrat-show.component';
import { TypeContratEditComponent } from './parametrage/typecontrat/typecontrat-edit/typecontrat-edit.component';
import { TypeContratListComponent } from './parametrage/typecontrat/typecontrat-list/typecontrat-list.component';
import { TypeEntiteNewComponent } from './parametrage/typeentite/typeentite-new/typeentite-new.component';
import { PageEditAccountComponent } from './apps/service-pages/edit-account/edit-account.component';
import { UserCloneComponent } from './parametrage/user/user-clone/user-clone.component';
import { UserShowComponent } from './parametrage/user/user-show/user-show.component';
import { UserEditComponent } from './parametrage/user/user-edit/user-edit.component';
import { GroupNewComponent } from './parametrage/group/group-new/group-new.component';
import { GroupListComponent } from './parametrage/group/group-list/group-list.component';
import { GroupEditComponent } from './parametrage/group/group-edit/group-edit.component';
import { GroupCloneComponent } from './parametrage/group/group-clone/group-clone.component';
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
import { TypeEntiteCloneComponent } from './parametrage/typeentite/typeentite-clone/typeentite-clone.component';
import { TypeEntiteEditComponent } from './parametrage/typeentite/typeentite-edit/typeentite-edit.component';
import { TypeEntiteListComponent } from './parametrage/typeentite/typeentite-list/typeentite-list.component';
import { TypeEntiteShowComponent } from './parametrage/typeentite/typeentite-show/typeentite-show.component';
import { EmployeCloneComponent } from './gestionemploye/employe/employe-clone/employe-clone.component';
import { EmployeEditComponent } from './gestionemploye/employe/employe-edit/employe-edit.component';
import { EmployeListComponent } from './gestionemploye/employe/employe-list/employe-list.component';
import { EmployeShowComponent } from './gestionemploye/employe/employe-show/employe-show.component';
import { EmployeNewComponent } from './gestionemploye/employe/employe-new/employe-new.component';
import { GradeCloneComponent } from './gestiongrade/grade/grade-clone/grade-clone.component';
import { GradeEditComponent } from './gestiongrade/grade/grade-edit/grade-edit.component';
import { GradeListComponent } from './gestiongrade/grade/grade-list/grade-list.component';
import { GradeShowComponent } from './gestiongrade/grade/grade-show/grade-show.component';
import { GradeNewComponent } from './gestiongrade/grade/grade-new/grade-new.component';
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
    UserCloneComponent,
    UserNewComponent,
    GroupCloneComponent,
    GroupEditComponent,
    GroupShowComponent,
    GroupListComponent,
    GroupNewComponent,
    // typeentite components
    TypeEntiteListComponent,
    TypeEntiteEditComponent,
    TypeEntiteShowComponent,
    TypeEntiteCloneComponent,
    TypeEntiteNewComponent,
    // typecontrat components
    TypeContratListComponent,
    TypeContratEditComponent,
    TypeContratShowComponent,
    TypeContratCloneComponent,
    TypeContratNewComponent,
    // typedocument components
    TypeDocumentListComponent,
    TypeDocumentEditComponent,
    TypeDocumentShowComponent,
    TypeDocumentCloneComponent,
    TypeDocumentNewComponent,

    // caissesociale components
    CaisseSocialeListComponent,
    CaisseSocialeEditComponent,
    CaisseSocialeShowComponent,
    CaisseSocialeCloneComponent,
    CaisseSocialeNewComponent,
    // fonction components
    FonctionListComponent,
    FonctionEditComponent,
    FonctionShowComponent,
    FonctionCloneComponent,
    FonctionNewComponent,
    // mutuellesante components
    MutuelleSanteListComponent,
    MutuelleSanteEditComponent,
    MutuelleSanteShowComponent,
    MutuelleSanteCloneComponent,
    MutuelleSanteNewComponent,
    // pays components
    PaysListComponent,
    PaysEditComponent,
    PaysShowComponent,
    PaysCloneComponent,
    PaysNewComponent,
    // typeemploye components
    TypeEmployeListComponent,
    TypeEmployeEditComponent,
    TypeEmployeShowComponent,
    TypeEmployeCloneComponent,
    TypeEmployeNewComponent,
    // structure components
    StructureListComponent,
    StructureEditComponent,
    StructureShowComponent,
    StructureCloneComponent,
    StructureNewComponent,
    // syndicat components
    SyndicatListComponent,
    SyndicatEditComponent,
    SyndicatShowComponent,
    SyndicatCloneComponent,
    SyndicatNewComponent,
    // grade components
    GradeListComponent,
    GradeEditComponent,
    GradeShowComponent,
    GradeCloneComponent,
    GradeNewComponent,
    // employe components
    EmployeListComponent,
    EmployeEditComponent,
    EmployeShowComponent,
    EmployeCloneComponent,
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

  ],
  exports: [],
  entryComponents: []
})
export class PagesModule { }
