import { Route } from '@angular/router';
import { GNiveauListComponent } from './gniveau-list/gniveau-list.component';
import { GNiveauShowComponent } from './gniveau-show/gniveau-show.component';
import { GNiveauEditComponent } from './gniveau-edit/gniveau-edit.component';

export const gNiveauRoutes: Route = {
    path: 'gniveau', children: [
        { path: '', component: GNiveauListComponent },
        { path: ':id/edit', component: GNiveauEditComponent },
        { path: ':id', component: GNiveauShowComponent }
    ]
};
