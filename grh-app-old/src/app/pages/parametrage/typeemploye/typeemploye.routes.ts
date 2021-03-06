import { Route } from '@angular/router';
import { TypeEmployeListComponent } from './typeemploye-list/typeemploye-list.component';
import { TypeEmployeShowComponent } from './typeemploye-show/typeemploye-show.component';
import { TypeEmployeEditComponent } from './typeemploye-edit/typeemploye-edit.component';

export const typeEmployeRoutes: Route = {
    path: 'typeemploye', children: [
        { path: '', component: TypeEmployeListComponent },
        { path: ':id/edit', component: TypeEmployeEditComponent },
        { path: ':id', component: TypeEmployeShowComponent }
    ]
}
