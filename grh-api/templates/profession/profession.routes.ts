import { Route } from '@angular/router';
import { ProfessionListComponent } from './profession-list/profession-list.component';
import { ProfessionShowComponent } from './profession-show/profession-show.component';
import { ProfessionEditComponent } from './profession-edit/profession-edit.component';
import { ProfessionCloneComponent } from './profession-clone/profession-clone.component';

export const professionRoutes: Route = {
    path: 'profession', children: [
        { path: '', component: ProfessionListComponent },
        { path: ':id/edit', component: ProfessionEditComponent },
        { path: ':id/clone', component: ProfessionCloneComponent },
        { path: ':id', component: ProfessionShowComponent }
    ]
};


// profession components
ProfessionListComponent,
ProfessionEditComponent,
ProfessionShowComponent,
ProfessionCloneComponent,
ProfessionNewComponent,
