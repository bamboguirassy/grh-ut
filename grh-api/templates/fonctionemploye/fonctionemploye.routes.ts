import { Route } from '@angular/router';
import { FonctionEmployeListComponent } from './fonctionemploye-list/fonctionemploye-list.component';
import { FonctionEmployeShowComponent } from './fonctionemploye-show/fonctionemploye-show.component';
import { FonctionEmployeEditComponent } from './fonctionemploye-edit/fonctionemploye-edit.component';
import { FonctionEmployeCloneComponent } from './fonctionemploye-clone/fonctionemploye-clone.component';

export const fonctionEmployeRoutes: Route = {
    path: 'fonctionemploye', children: [
        { path: '', component: FonctionEmployeListComponent },
        { path: ':id/edit', component: FonctionEmployeEditComponent },
        { path: ':id/clone', component: FonctionEmployeCloneComponent },
        { path: ':id', component: FonctionEmployeShowComponent }
    ]
};


// fonctionemploye components
FonctionEmployeListComponent,
FonctionEmployeEditComponent,
FonctionEmployeShowComponent,
FonctionEmployeCloneComponent,
FonctionEmployeNewComponent,
