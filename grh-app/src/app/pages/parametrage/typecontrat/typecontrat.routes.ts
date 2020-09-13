import { Route } from '@angular/router';
import { TypeContratListComponent } from './typecontrat-list/typecontrat-list.component';
import { TypeContratShowComponent } from './typecontrat-show/typecontrat-show.component';
import { TypeContratEditComponent } from './typecontrat-edit/typecontrat-edit.component';
import { TypeContratCloneComponent } from './typecontrat-clone/typecontrat-clone.component';

export const typeContratRoutes: Route = {
    path: 'typecontrat', children: [
        { path: '', component: TypeContratListComponent },
        { path: ':id/edit', component: TypeContratEditComponent },
        { path: ':id/clone', component: TypeContratCloneComponent },
        { path: ':id', component: TypeContratShowComponent }
    ]
};
