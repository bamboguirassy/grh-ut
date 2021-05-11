import { Route } from '@angular/router';
import { StructureFonctionListComponent } from './structurefonction-list/structurefonction-list.component';
import { StructureFonctionShowComponent } from './structurefonction-show/structurefonction-show.component';
import { StructureFonctionEditComponent } from './structurefonction-edit/structurefonction-edit.component';
import { StructureFonctionCloneComponent } from './structurefonction-clone/structurefonction-clone.component';

export const structureFonctionRoutes: Route = {
    path: 'structurefonction', children: [
        { path: '', component: StructureFonctionListComponent },
        { path: ':id/edit', component: StructureFonctionEditComponent },
        { path: ':id/clone', component: StructureFonctionCloneComponent },
        { path: ':id', component: StructureFonctionShowComponent }
    ]
};


// structurefonction components
StructureFonctionListComponent,
StructureFonctionEditComponent,
StructureFonctionShowComponent,
StructureFonctionCloneComponent,
StructureFonctionNewComponent,
