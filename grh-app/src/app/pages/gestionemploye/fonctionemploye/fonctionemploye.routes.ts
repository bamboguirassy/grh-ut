import { Route } from '@angular/router';
import { FonctionEmployeListComponent } from './fonctionemploye-list/fonctionemploye-list.component';
import { FonctionEmployeShowComponent } from './fonctionemploye-show/fonctionemploye-show.component';
import { FonctionEmployeEditComponent } from './fonctionemploye-edit/fonctionemploye-edit.component';
import { FonctionEmployeCloneComponent } from './fonctionemploye-clone/fonctionemploye-clone.component';
import { FonctionEnExpirationComponent } from './fonction-en-expiration/fonction-en-expiration.component';

export const fonctionEmployeRoutes: Route =
 {
    path: 'fonction-en-expiration', children: [
        { path: '', component: FonctionEnExpirationComponent }
    ],
     
};
