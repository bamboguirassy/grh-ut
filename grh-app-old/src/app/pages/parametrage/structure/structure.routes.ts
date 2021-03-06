import { Route } from '@angular/router';
import { StructureListComponent } from './structure-list/structure-list.component';
import { StructureShowComponent } from './structure-show/structure-show.component';
import { StructureEditComponent } from './structure-edit/structure-edit.component';

export const structureRoutes: Route = {
    path: 'structure', children: [
        { path: '', component: StructureListComponent },
        { path: ':id/edit', component: StructureEditComponent },
        { path: ':id', component: StructureShowComponent }
    ]
};
