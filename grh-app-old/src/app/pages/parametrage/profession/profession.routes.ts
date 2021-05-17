import { Route } from '@angular/router';
import { ProfessionListComponent } from './profession-list/profession-list.component';
import { ProfessionShowComponent } from './profession-show/profession-show.component';
import { ProfessionEditComponent } from './profession-edit/profession-edit.component';

export const professionRoutes: Route = {
    path: 'profession', children: [
        { path: '', component: ProfessionListComponent },
        { path: ':id/edit', component: ProfessionEditComponent },
        { path: ':id', component: ProfessionShowComponent }
    ]
};
