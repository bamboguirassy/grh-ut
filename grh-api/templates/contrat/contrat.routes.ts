import { Route } from '@angular/router';
import { ContratListComponent } from './contrat-list/contrat-list.component';
import { ContratShowComponent } from './contrat-show/contrat-show.component';
import { ContratEditComponent } from './contrat-edit/contrat-edit.component';
import { ContratCloneComponent } from './contrat-clone/contrat-clone.component';

export const contratRoutes: Route = {
    path: 'contrat', children: [
        { path: '', component: ContratListComponent },
        { path: ':id/edit', component: ContratEditComponent },
        { path: ':id/clone', component: ContratCloneComponent },
        { path: ':id', component: ContratShowComponent }
    ]
};


// contrat components
ContratListComponent,
ContratEditComponent,
ContratShowComponent,
ContratCloneComponent,
ContratNewComponent,
