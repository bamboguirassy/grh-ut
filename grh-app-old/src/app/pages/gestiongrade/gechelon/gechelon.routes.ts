import { Route } from '@angular/router';
import { GEchelonListComponent } from './gechelon-list/gechelon-list.component';
import { GEchelonShowComponent } from './gechelon-show/gechelon-show.component';
import { GEchelonEditComponent } from './gechelon-edit/gechelon-edit.component';


export const gEchelonRoutes: Route = {
    path: 'gechelon', children: [
        { path: '', component: GEchelonListComponent },
        { path: ':id/edit', component: GEchelonEditComponent },
        { path: ':id', component: GEchelonShowComponent }
    ]
};
