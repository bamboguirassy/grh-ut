import { Route } from '@angular/router';
import { RangListComponent } from './rang-list/rang-list.component';
import { RangShowComponent } from './rang-show/rang-show.component';
import { RangEditComponent } from './rang-edit/rang-edit.component';

export const rangRoutes: Route = {
    path: 'rang', children: [
        { path: '', component: RangListComponent },
        { path: ':id/edit', component: RangEditComponent },
        { path: ':id', component: RangShowComponent }
    ]
};
