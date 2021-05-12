import { Route } from '@angular/router';
import { MutuelleSanteListComponent } from './mutuellesante-list/mutuellesante-list.component';
import { MutuelleSanteShowComponent } from './mutuellesante-show/mutuellesante-show.component';
import { MutuelleSanteEditComponent } from './mutuellesante-edit/mutuellesante-edit.component';

export const mutuelleSanteRoutes: Route = {
    path: 'mutuellesante', children: [
        { path: '', component: MutuelleSanteListComponent },
        { path: ':id/edit', component: MutuelleSanteEditComponent },
        { path: ':id', component: MutuelleSanteShowComponent }
    ]
};
