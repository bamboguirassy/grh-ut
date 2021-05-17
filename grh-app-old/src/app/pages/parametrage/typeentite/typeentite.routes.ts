import { Route } from '@angular/router';
import { TypeEntiteListComponent } from './typeentite-list/typeentite-list.component';
import { TypeEntiteShowComponent } from './typeentite-show/typeentite-show.component';
import { TypeEntiteEditComponent } from './typeentite-edit/typeentite-edit.component';

export const typeEntiteRoutes: Route = {
    path: 'typeentite', children: [
        { path: '', component: TypeEntiteListComponent },
        { path: ':id/edit', component: TypeEntiteEditComponent },
        { path: ':id', component: TypeEntiteShowComponent }
    ]
};