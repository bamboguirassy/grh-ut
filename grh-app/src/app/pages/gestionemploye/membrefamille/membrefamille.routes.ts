import { Route } from '@angular/router';
import { MembreFamilleListComponent } from './membrefamille-list/membrefamille-list.component';
import { MembreFamilleShowComponent } from './membrefamille-show/membrefamille-show.component';
import { MembreFamilleEditComponent } from './membrefamille-edit/membrefamille-edit.component';
import { MembreFamilleCloneComponent } from './membrefamille-clone/membrefamille-clone.component';

export const membreFamilleRoutes: Route = {
    path: 'membrefamille', children: [
        { path: '', component: MembreFamilleListComponent },
        { path: ':id/edit', component: MembreFamilleEditComponent },
        { path: ':id/clone', component: MembreFamilleCloneComponent },
        { path: ':id', component: MembreFamilleShowComponent }
    ]
};
