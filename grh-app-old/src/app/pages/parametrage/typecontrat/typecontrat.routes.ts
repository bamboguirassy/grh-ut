import { Route } from '@angular/router';
import { TypeContratListComponent } from './typecontrat-list/typecontrat-list.component';
import { TypeContratShowComponent } from './typecontrat-show/typecontrat-show.component';
import { TypeContratEditComponent } from './typecontrat-edit/typecontrat-edit.component';

export const typeContratRoutes: Route = {
    path: 'typecontrat', children: [
        { path: '', component: TypeContratListComponent },
        { path: ':id/edit', component: TypeContratEditComponent },
        { path: ':id', component: TypeContratShowComponent }
    ]
};
