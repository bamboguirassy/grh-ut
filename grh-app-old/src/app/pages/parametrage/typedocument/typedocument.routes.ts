import { Route } from '@angular/router';
import { TypeDocumentListComponent } from './typedocument-list/typedocument-list.component';
import { TypeDocumentShowComponent } from './typedocument-show/typedocument-show.component';
import { TypeDocumentEditComponent } from './typedocument-edit/typedocument-edit.component';

export const typeDocumentRoutes: Route = {
    path: 'typedocument', children: [
        { path: '', component: TypeDocumentListComponent },
        { path: ':id/edit', component: TypeDocumentEditComponent },
        { path: ':id', component: TypeDocumentShowComponent }
    ]
};
