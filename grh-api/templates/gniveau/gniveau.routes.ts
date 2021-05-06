import { Route } from '@angular/router';
import { GNiveauListComponent } from './gniveau-list/gniveau-list.component';
import { GNiveauShowComponent } from './gniveau-show/gniveau-show.component';
import { GNiveauEditComponent } from './gniveau-edit/gniveau-edit.component';
import { GNiveauCloneComponent } from './gniveau-clone/gniveau-clone.component';

export const gNiveauRoutes: Route = {
    path: 'gniveau', children: [
        { path: '', component: GNiveauListComponent },
        { path: ':id/edit', component: GNiveauEditComponent },
        { path: ':id/clone', component: GNiveauCloneComponent },
        { path: ':id', component: GNiveauShowComponent }
    ]
};


// gniveau components
GNiveauListComponent,
GNiveauEditComponent,
GNiveauShowComponent,
GNiveauCloneComponent,
GNiveauNewComponent,
