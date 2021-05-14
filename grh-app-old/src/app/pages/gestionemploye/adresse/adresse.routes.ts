import { Route } from '@angular/router';
import { AdresseListComponent } from './adresse-list/adresse-list.component';
import { AdresseShowComponent } from './adresse-show/adresse-show.component';
import { AdresseEditComponent } from './adresse-edit/adresse-edit.component';
import { AdresseCloneComponent } from './adresse-clone/adresse-clone.component';

export const adresseRoutes: Route = {
    path: 'adresse', children: [
        { path: '', component: AdresseListComponent },
        { path: ':id/edit', component: AdresseEditComponent },
        { path: ':id/clone', component: AdresseCloneComponent },
        { path: ':id', component: AdresseShowComponent }
    ]
};
