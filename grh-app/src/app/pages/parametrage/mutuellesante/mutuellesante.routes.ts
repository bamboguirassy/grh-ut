import { Route } from '@angular/router';
import { MutuelleSanteListComponent } from './mutuellesante-list/mutuellesante-list.component';
import { MutuelleSanteShowComponent } from './mutuellesante-show/mutuellesante-show.component';
import { MutuelleSanteEditComponent } from './mutuellesante-edit/mutuellesante-edit.component';
import { MutuelleSanteCloneComponent } from './mutuellesante-clone/mutuellesante-clone.component';

export const mutuelleSanteRoutes: Route = {
    path: 'mutuellesante', children: [
        { path: '', component: MutuelleSanteListComponent },
        { path: ':id/edit', component: MutuelleSanteEditComponent },
        { path: ':id/clone', component: MutuelleSanteCloneComponent },
        { path: ':id', component: MutuelleSanteShowComponent }
    ]
};
