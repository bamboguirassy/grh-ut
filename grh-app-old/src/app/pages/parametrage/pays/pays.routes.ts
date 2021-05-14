import { Route } from '@angular/router';
import { PaysListComponent } from './pays-list/pays-list.component';
import { PaysShowComponent } from './pays-show/pays-show.component';
import { PaysEditComponent } from './pays-edit/pays-edit.component';

export const paysRoutes: Route = {
    path: 'pays', children: [
        { path: '', component: PaysListComponent },
        { path: ':id/edit', component: PaysEditComponent },
        { path: ':id', component: PaysShowComponent }
    ]
};
