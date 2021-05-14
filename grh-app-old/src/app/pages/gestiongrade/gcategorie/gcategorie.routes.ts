import { Route } from '@angular/router';
import { GCategorieListComponent } from './gcategorie-list/gcategorie-list.component';
import { GCategorieShowComponent } from './gcategorie-show/gcategorie-show.component';
import { GCategorieEditComponent } from './gcategorie-edit/gcategorie-edit.component';

export const gCategorieRoutes: Route = {
    path: 'gcategorie', children: [
        { path: '', component: GCategorieListComponent },
        { path: ':id/edit', component: GCategorieEditComponent },
        { path: ':id', component: GCategorieShowComponent }
    ]
};
