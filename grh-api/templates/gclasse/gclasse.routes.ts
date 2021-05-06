import { Route } from '@angular/router';
import { GClasseListComponent } from './gclasse-list/gclasse-list.component';
import { GClasseShowComponent } from './gclasse-show/gclasse-show.component';
import { GClasseEditComponent } from './gclasse-edit/gclasse-edit.component';
import { GClasseCloneComponent } from './gclasse-clone/gclasse-clone.component';

export const gClasseRoutes: Route = {
    path: 'gclasse', children: [
        { path: '', component: GClasseListComponent },
        { path: ':id/edit', component: GClasseEditComponent },
        { path: ':id/clone', component: GClasseCloneComponent },
        { path: ':id', component: GClasseShowComponent }
    ]
};


// gclasse components
GClasseListComponent,
GClasseEditComponent,
GClasseShowComponent,
GClasseCloneComponent,
GClasseNewComponent,
