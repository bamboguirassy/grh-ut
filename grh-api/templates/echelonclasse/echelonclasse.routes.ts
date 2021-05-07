import { Route } from '@angular/router';
import { EchelonClasseListComponent } from './echelonclasse-list/echelonclasse-list.component';
import { EchelonClasseShowComponent } from './echelonclasse-show/echelonclasse-show.component';
import { EchelonClasseEditComponent } from './echelonclasse-edit/echelonclasse-edit.component';
import { EchelonClasseCloneComponent } from './echelonclasse-clone/echelonclasse-clone.component';

export const echelonClasseRoutes: Route = {
    path: 'echelonclasse', children: [
        { path: '', component: EchelonClasseListComponent },
        { path: ':id/edit', component: EchelonClasseEditComponent },
        { path: ':id/clone', component: EchelonClasseCloneComponent },
        { path: ':id', component: EchelonClasseShowComponent }
    ]
};


// echelonclasse components
EchelonClasseListComponent,
EchelonClasseEditComponent,
EchelonClasseShowComponent,
EchelonClasseCloneComponent,
EchelonClasseNewComponent,
