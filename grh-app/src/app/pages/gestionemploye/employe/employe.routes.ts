import { Route } from '@angular/router';
import { EmployeListComponent } from './employe-list/employe-list.component';
import { EmployeShowComponent } from './employe-show/employe-show.component';
import { EmployeEditComponent } from './employe-edit/employe-edit.component';
import { EmployeCloneComponent } from './employe-clone/employe-clone.component';

export const employeRoutes: Route = {
    path: 'employe', children: [
        { path: '', component: EmployeListComponent },
        { path: ':id/edit', component: EmployeEditComponent },
        { path: ':id/clone', component: EmployeCloneComponent },
        { path: ':id', component: EmployeShowComponent }
    ]
};
