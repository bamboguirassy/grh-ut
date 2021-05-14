import { Route } from '@angular/router';
import { DocumentListComponent } from './document-list/document-list.component';
import { DocumentShowComponent } from './document-show/document-show.component';
import { DocumentEditComponent } from './document-edit/document-edit.component';
import { DocumentCloneComponent } from './document-clone/document-clone.component';

export const documentRoutes: Route = {
    path: 'document', children: [
        { path: '', component: DocumentListComponent },
        { path: ':id/edit', component: DocumentEditComponent },
        { path: ':id/clone', component: DocumentCloneComponent },
        { path: ':id', component: DocumentShowComponent }
    ]
};
