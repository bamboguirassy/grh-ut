import { Route } from '@angular/router';

import { GroupListComponent } from './group-list/group-list.component';
import { GroupShowComponent } from './group-show/group-show.component';
import { GroupEditComponent } from './group-edit/group-edit.component';

export const groupRoutes: Route = {
    path: 'group', children: [
        { path: '', component: GroupListComponent },
        { path: ':id/edit', component: GroupEditComponent },
        { path: ':id', component: GroupShowComponent }
    ]

};