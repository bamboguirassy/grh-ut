import { Route } from '@angular/router';
import { FonctionListComponent } from './fonction-list/fonction-list.component';
import { FonctionShowComponent } from './fonction-show/fonction-show.component';
import { FonctionEditComponent } from './fonction-edit/fonction-edit.component';

export const fonctionRoutes: Route = {
    path: 'fonction', children: [
        { path: '', component: FonctionListComponent },
        { path: ':id/edit', component: FonctionEditComponent },
        { path: ':id', component: FonctionShowComponent }
    ]
};
