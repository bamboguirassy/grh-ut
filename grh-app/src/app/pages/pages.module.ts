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
    GroupNewComponent
  ],
  exports: [ ],
  entryComponents: [ ]
})
export class PagesModule {}
