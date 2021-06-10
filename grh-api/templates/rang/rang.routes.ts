import { Route } from '@angular/router';
import { RangListComponent } from './rang-list/rang-list.component';
import { RangShowComponent } from './rang-show/rang-show.component';
import { RangEditComponent } from './rang-edit/rang-edit.component';
import { RangCloneComponent } from './rang-clone/rang-clone.component';

export const rangRoutes: Route = {
    path: 'rang', children: [
        { path: '', component: RangListComponent },
        { path: ':id/edit', component: RangEditComponent },
        { path: ':id/clone', component: RangCloneComponent },
        { path: ':id', component: RangShowComponent }
    ]
};


// rang components
RangListComponent,
RangEditComponent,
RangShowComponent,
RangCloneComponent,
RangNewComponent,
