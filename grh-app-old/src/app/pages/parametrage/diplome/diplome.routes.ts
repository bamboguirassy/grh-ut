import { Route } from '@angular/router';
import { DiplomeListComponent } from './diplome-list/diplome-list.component';
import { DiplomeShowComponent } from './diplome-show/diplome-show.component';
import { DiplomeEditComponent } from './diplome-edit/diplome-edit.component';

export const diplomeRoutes: Route = {
    path: 'diplome', children: [
        { path: '', component: DiplomeListComponent },
        { path: ':id/edit', component: DiplomeEditComponent },
        { path: ':id', component: DiplomeShowComponent }
    ]
};



