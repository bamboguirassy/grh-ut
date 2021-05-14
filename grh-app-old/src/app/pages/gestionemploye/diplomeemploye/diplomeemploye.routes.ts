import { Route } from '@angular/router';
import { DiplomeEmployeListComponent } from './diplomeemploye-list/diplomeemploye-list.component';
import { DiplomeEmployeShowComponent } from './diplomeemploye-show/diplomeemploye-show.component';
import { DiplomeEmployeEditComponent } from './diplomeemploye-edit/diplomeemploye-edit.component';
import { DiplomeEmployeCloneComponent } from './diplomeemploye-clone/diplomeemploye-clone.component';

export const diplomeEmployeRoutes: Route = {
    path: 'diplomeemploye', children: [
        { path: '', component: DiplomeEmployeListComponent },
        { path: ':id/edit', component: DiplomeEmployeEditComponent },
        { path: ':id/clone', component: DiplomeEmployeCloneComponent },
        { path: ':id', component: DiplomeEmployeShowComponent }
    ]
};



