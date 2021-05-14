import { Route } from '@angular/router';
import { GClasseListComponent } from './gclasse-list/gclasse-list.component';
import { GClasseShowComponent } from './gclasse-show/gclasse-show.component';
import { GClasseEditComponent } from './gclasse-edit/gclasse-edit.component';

export const gClasseRoutes: Route = {
    path: 'gclasse', children: [
        { path: '', component: GClasseListComponent },
        { path: ':id/edit', component: GClasseEditComponent },
        { path: ':id', component: GClasseShowComponent }
    ]
};
