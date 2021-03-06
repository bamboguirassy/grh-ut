import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { MalihuScrollbarModule } from 'ngx-malihu-scrollbar';

import { UIModule } from '../ui/ui.module';
import { BaseLayoutComponent } from './base-layout';
import { HorizontalLayoutComponent } from './horizontal';
import { VerticalLayoutComponent } from './vertical';
import { PublicLayoutComponent } from './public';
import { NavbarComponent } from './components/navbar';
import { MenuComponent } from './components/menu';
import { FooterComponent } from './components/footer';
import { LogoComponent } from './components/logo';
import { SearchComponent } from './components/search';
import { ActionsComponent } from './components/actions';
import { LoginFormComponent } from './components/login-form';
import { RegisterFormComponent } from './components/register-form';
import { NavbarSkeletonComponent } from './components/navbar-skeleton';
import { SettingsComponent } from './components/settings';
import { EmployeSearchComponent } from './components/employe-search/employe-search.component';
import { NzAutocompleteModule } from 'ng-zorro-antd/auto-complete';
import { ResetPasswordFormComponent } from './components/reset-password-form/reset-password-form.component';

@NgModule({
  imports: [
    CommonModule,
    RouterModule,
    FormsModule,
    ReactiveFormsModule,
    MalihuScrollbarModule.forRoot(),
    UIModule,
    NzAutocompleteModule
  ],
  declarations: [
    BaseLayoutComponent,
    HorizontalLayoutComponent,
    VerticalLayoutComponent,

    NavbarComponent,
    MenuComponent,
    FooterComponent,
    LogoComponent,
    SearchComponent,
    ActionsComponent,
    PublicLayoutComponent,
    LoginFormComponent,
    RegisterFormComponent,
    ResetPasswordFormComponent,
    NavbarSkeletonComponent,
    SettingsComponent,
    EmployeSearchComponent
  ],
  exports: [
    LoginFormComponent,
    RegisterFormComponent,
    ResetPasswordFormComponent,
    SettingsComponent,
    EmployeSearchComponent,
    NzAutocompleteModule
  ],
  schemas: [ CUSTOM_ELEMENTS_SCHEMA ]
})
export class LayoutModule { }
