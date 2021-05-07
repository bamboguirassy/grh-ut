import { Route } from '@angular/router';
import { SyndicatListComponent } from './syndicat-list/syndicat-list.component';
import { SyndicatShowComponent } from './syndicat-show/syndicat-show.component';
import { SyndicatEditComponent } from './syndicat-edit/syndicat-edit.component';

export const syndicatRoutes: Route = {
    path: 'syndicat', children: [
        { path: '', component: SyndicatListComponent },
        { path: ':id/edit', component: SyndicatEditComponent },
        { path: ':id', component: SyndicatShowComponent }
    ]
};
