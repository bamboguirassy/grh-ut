import { Route } from '@angular/router';
import { StructureFonctionListComponent } from './structurefonction-list/structurefonction-list.component';
import { StructureFonctionNewComponent } from './structurefonction-new/structurefonction-new.component';

export const structureFonctionRoutes: Route = {
    path: 'structurefonction', children: [
        { path: '', component: StructureFonctionListComponent },
        { path: '/create', component: StructureFonctionNewComponent }
    ]
};
