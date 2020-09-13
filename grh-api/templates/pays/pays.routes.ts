import { Route } from '@angular/router';
import { PaysListComponent } from './pays-list/pays-list.component';
import { PaysShowComponent } from './pays-show/pays-show.component';
import { PaysEditComponent } from './pays-edit/pays-edit.component';
import { PaysCloneComponent } from './pays-clone/pays-clone.component';

export const payRoutes: Route = {
    path: 'pays', children: [
        { path: '', component: PaysListComponent },
        { path: ':id/edit', component: PaysEditComponent },
        { path: ':id/clone', component: PaysCloneComponent },
        { path: ':id', component: PaysShowComponent }
    ]
};


// pays components
PaysListComponent,
PaysEditComponent,
PaysShowComponent,
PaysCloneComponent,
PaysNewComponent,
