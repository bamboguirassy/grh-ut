import { Route } from '@angular/router';
import { CaisseSocialeListComponent } from './caissesociale-list/caissesociale-list.component';
import { CaisseSocialeShowComponent } from './caissesociale-show/caissesociale-show.component';
import { CaisseSocialeEditComponent } from './caissesociale-edit/caissesociale-edit.component';
import { CaisseSocialeCloneComponent } from './caissesociale-clone/caissesociale-clone.component';

export const caisseSocialeRoutes: Route = {
    path: 'caissesociale', children: [
        { path: '', component: CaisseSocialeListComponent },
        { path: ':id/edit', component: CaisseSocialeEditComponent },
        { path: ':id/clone', component: CaisseSocialeCloneComponent },
        { path: ':id', component: CaisseSocialeShowComponent }
    ]
};


// caissesociale components
CaisseSocialeListComponent,
CaisseSocialeEditComponent,
CaisseSocialeShowComponent,
CaisseSocialeCloneComponent,
CaisseSocialeNewComponent,
