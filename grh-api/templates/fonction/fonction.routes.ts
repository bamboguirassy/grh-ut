import { Route } from '@angular/router';
import { FonctionListComponent } from './fonction-list/fonction-list.component';
import { FonctionShowComponent } from './fonction-show/fonction-show.component';
import { FonctionEditComponent } from './fonction-edit/fonction-edit.component';
import { FonctionCloneComponent } from './fonction-clone/fonction-clone.component';

export const fonctionRoutes: Route = {
    path: 'fonction', children: [
        { path: '', component: FonctionListComponent },
        { path: ':id/edit', component: FonctionEditComponent },
        { path: ':id/clone', component: FonctionCloneComponent },
        { path: ':id', component: FonctionShowComponent }
    ]
};


// fonction components
FonctionListComponent,
FonctionEditComponent,
FonctionShowComponent,
FonctionCloneComponent,
FonctionNewComponent,
