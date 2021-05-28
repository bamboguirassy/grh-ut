import { Route } from '@angular/router';
import { AffectationListComponent } from './affectation-list/affectation-list.component';
import { AffectationShowComponent } from './affectation-show/affectation-show.component';
import { AffectationEditComponent } from './affectation-edit/affectation-edit.component';

export const affectationRoutes: Route = {
    path: 'affectation', children: [
        { path: '', component: AffectationListComponent },
        { path: ':id/edit', component: AffectationEditComponent },
        { path: ':id', component: AffectationShowComponent }
    ]
};



