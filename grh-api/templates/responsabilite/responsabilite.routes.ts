import { Route } from '@angular/router';
import { ResponsabiliteListComponent } from './responsabilite-list/responsabilite-list.component';
import { ResponsabiliteShowComponent } from './responsabilite-show/responsabilite-show.component';
import { ResponsabiliteEditComponent } from './responsabilite-edit/responsabilite-edit.component';
import { ResponsabiliteCloneComponent } from './responsabilite-clone/responsabilite-clone.component';

export const responsabiliteRoutes: Route = {
    path: 'responsabilite', children: [
        { path: '', component: ResponsabiliteListComponent },
        { path: ':id/edit', component: ResponsabiliteEditComponent },
        { path: ':id/clone', component: ResponsabiliteCloneComponent },
        { path: ':id', component: ResponsabiliteShowComponent }
    ]
};


// responsabilite components
ResponsabiliteListComponent,
ResponsabiliteEditComponent,
ResponsabiliteShowComponent,
ResponsabiliteCloneComponent,
ResponsabiliteNewComponent,
