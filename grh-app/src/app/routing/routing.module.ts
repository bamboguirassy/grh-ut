import { fonctionEmployeRoutes } from './../pages/gestionemploye/fonctionemploye/fonctionemploye.routes';
import { documentRoutes } from './../pages/gestionemploye/document/document.routes';
import { membreSyndicatRoutes } from './../pages/gestionemploye/membresyndicat/membresyndicat.routes';
import { membreFamilleRoutes } from './../pages/gestionemploye/membrefamille/membrefamille.routes';
import { adresseRoutes } from './../pages/gestionemploye/adresse/adresse.routes';
import { employeRoutes } from './../pages/gestionemploye/employe/employe.routes';
import { gradeRoutes } from './../pages/gestiongrade/grade/grade.routes';
import {gNiveauRoutes} from './../pages/gestiongrade/gniveau/gniveau.routes';
import {gEchelonRoutes} from './../pages/gestiongrade/gechelon/gechelon.routes';
import { syndicatRoutes } from './../pages/parametrage/syndicat/syndicat.routes';
import { structureRoutes } from './../pages/parametrage/structure/structure.routes';
import { paysRoutes } from './../pages/parametrage/pays/pays.routes';
import { fonctionRoutes } from './../pages/parametrage/fonction/fonction.routes';
import { mutuelleSanteRoutes } from './../pages/parametrage/mutuellesante/mutuellesante.routes';
import { caisseSocialeRoutes } from './../pages/parametrage/caissesociale/caissesociale.routes';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { VerticalLayoutComponent } from '../layout/vertical';
import { HorizontalLayoutComponent } from '../layout/horizontal';
import { PublicLayoutComponent } from '../layout/public';

import { PageDashboardComponent } from '../pages/dashboards/dashboard-1';
import { PageUserProfileComponent } from '../pages/apps/service-pages/user-profile';
import { PageSignInComponent } from '../pages/apps/sessions/sign-in';
import { PageSignUpComponent } from '../pages/apps/sessions/sign-up';
import { PageSettingsComponent } from '../pages/settings';
import { Page404Component } from '../pages/apps/sessions/page-404';
import { Page500Component } from '../pages/apps/sessions/page-500';
import { userRoutes } from '../pages/parametrage/user/user.routes';
import { groupRoutes } from '../pages/parametrage/group/group.routes';
import { typeEntiteRoutes } from '../pages/parametrage/typeentite/typeentite.routes';
import { typeContratRoutes } from '../pages/parametrage/typecontrat/typecontrat.routes';
import { typeDocumentRoutes } from '../pages/parametrage/typedocument/typedocument.routes';
import { typeEmployeRoutes } from '../pages/parametrage/typeemploye/typeemploye.routes';
import { professionRoutes } from '../pages/parametrage/profession/profession.routes';
import { PageEditAccountComponent } from '../pages/apps/service-pages/edit-account/edit-account.component';
import { gClasseRoutes } from '../pages/gestiongrade/gclasse/gclasse.routes';
import { gCategorieRoutes } from '../pages/gestiongrade/gcategorie/gcategorie.routes';

const VERTICAL_ROUTES: Routes = [
  { path: 'default-dashboard', component: PageDashboardComponent },

  { path: 'edit-account', component: PageEditAccountComponent },
  { path: 'user-profile', component: PageUserProfileComponent },
  { path: 'settings', component: PageSettingsComponent },
  userRoutes,
  groupRoutes,
  typeEntiteRoutes,
  typeContratRoutes,
  typeDocumentRoutes,
  caisseSocialeRoutes,
  mutuelleSanteRoutes,
  fonctionRoutes,
  paysRoutes,
  typeEmployeRoutes,
  structureRoutes,
  syndicatRoutes,
  gradeRoutes,
  gNiveauRoutes,
  gEchelonRoutes,
  employeRoutes,
  adresseRoutes,
  membreFamilleRoutes,
  membreSyndicatRoutes,
  documentRoutes,
  fonctionEmployeRoutes,
  gClasseRoutes,
  professionRoutes,
  gCategorieRoutes
];

const PUBLIC_ROUTES: Routes = [
  { path: 'sign-in', component: PageSignInComponent },
  { path: 'sign-up', component: PageSignUpComponent },
  { path: 'page-404', component: Page404Component },
  { path: 'page-500', component: Page500Component },
  { path: '**', component: Page404Component }
];

export const ROUTES: Routes = [
  {
    path: '',
    redirectTo: '/horizontal/default-dashboard',
    pathMatch: 'full'
  },
  {
    path: 'vertical',
    component: VerticalLayoutComponent,
    children: VERTICAL_ROUTES
  },
  {
    path: 'horizontal',
    component: HorizontalLayoutComponent,
    children: VERTICAL_ROUTES
  },
  {
    path: 'public',
    component: PublicLayoutComponent,
    children: PUBLIC_ROUTES
  },
  {
    path: '**',
    component: PublicLayoutComponent,
    children: PUBLIC_ROUTES
  }
];

@NgModule({
  imports: [

  ],
  exports: [
    RouterModule
  ],
  declarations: []
})
export class RoutingModule { }
