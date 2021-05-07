import { Route } from '@angular/router';
import { GEchelonListComponent } from './gechelon-list/gechelon-list.component';
import { GEchelonShowComponent } from './gechelon-show/gechelon-show.component';
import { GEchelonEditComponent } from './gechelon-edit/gechelon-edit.component';
import { GEchelonCloneComponent } from './gechelon-clone/gechelon-clone.component';

export const gEchelonRoutes: Route = {
    path: 'gechelon', children: [
        { path: '', component: GEchelonListComponent },
        { path: ':id/edit', component: GEchelonEditComponent },
        { path: ':id/clone', component: GEchelonCloneComponent },
        { path: ':id', component: GEchelonShowComponent }
    ]
};


// gechelon components
GEchelonListComponent,
GEchelonEditComponent,
GEchelonShowComponent,
GEchelonCloneComponent,
GEchelonNewComponent,
