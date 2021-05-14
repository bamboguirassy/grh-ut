import { Route } from '@angular/router';
import { MembreSyndicatListComponent } from './membresyndicat-list/membresyndicat-list.component';
import { MembreSyndicatShowComponent } from './membresyndicat-show/membresyndicat-show.component';
import { MembreSyndicatEditComponent } from './membresyndicat-edit/membresyndicat-edit.component';
import { MembreSyndicatCloneComponent } from './membresyndicat-clone/membresyndicat-clone.component';

export const membreSyndicatRoutes: Route = {
    path: 'membresyndicat', children: [
        { path: '', component: MembreSyndicatListComponent },
        { path: ':id/edit', component: MembreSyndicatEditComponent },
        { path: ':id/clone', component: MembreSyndicatCloneComponent },
        { path: ':id', component: MembreSyndicatShowComponent }
    ]
};
