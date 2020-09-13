import { Route } from '@angular/router';
import { TypeDocumentListComponent } from './typedocument-list/typedocument-list.component';
import { TypeDocumentShowComponent } from './typedocument-show/typedocument-show.component';
import { TypeDocumentEditComponent } from './typedocument-edit/typedocument-edit.component';
import { TypeDocumentCloneComponent } from './typedocument-clone/typedocument-clone.component';

export const typeDocumentRoutes: Route = {
    path: 'typedocument', children: [
        { path: '', component: TypeDocumentListComponent },
        { path: ':id/edit', component: TypeDocumentEditComponent },
        { path: ':id/clone', component: TypeDocumentCloneComponent },
        { path: ':id', component: TypeDocumentShowComponent }
    ]
};


// typedocument components
TypeDocumentListComponent,
TypeDocumentEditComponent,
TypeDocumentShowComponent,
TypeDocumentCloneComponent,
TypeDocumentNewComponent,
