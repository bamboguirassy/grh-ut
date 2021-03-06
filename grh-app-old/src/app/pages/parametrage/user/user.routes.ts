import { Route } from '@angular/router';
import { UserListComponent } from './user-list/user-list.component';
import { UserEditComponent } from './user-edit/user-edit.component';
import { UserShowComponent } from './user-show/user-show.component';

export const userRoutes: Route = {
    path: 'user', children: [
        { path: '', component: UserListComponent },
        { path: ':id/edit', component: UserEditComponent },
        { path: ':id', component: UserShowComponent }
    ]

};