import { Route } from '@angular/router';
import { CommissionListComponent } from './commission-list/commission-list.component';
import { CommissionShowComponent } from './commission-show/commission-show.component';
import { CommissionEditComponent } from './commission-edit/commission-edit.component';
import { CommissionCloneComponent } from './commission-clone/commission-clone.component';

export const commissionRoutes: Route = {
    path: 'commission', children: [
        { path: '', component: CommissionListComponent },
        { path: ':id/edit', component: CommissionEditComponent },
        { path: ':id/clone', component: CommissionCloneComponent },
        { path: ':id', component: CommissionShowComponent }
    ]
};


// commission components
CommissionListComponent,
CommissionEditComponent,
CommissionShowComponent,
CommissionCloneComponent,
CommissionNewComponent,
