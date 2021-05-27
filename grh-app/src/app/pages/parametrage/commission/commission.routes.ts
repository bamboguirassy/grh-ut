import { Route } from '@angular/router';
import { CommissionListComponent } from './commission-list/commission-list.component';
import { CommissionShowComponent } from './commission-show/commission-show.component';
import { CommissionEditComponent } from './commission-edit/commission-edit.component';

export const commissionRoutes: Route = {
    path: 'commission', children: [
        { path: '', component: CommissionListComponent },
        { path: ':id/edit', component: CommissionEditComponent },
        { path: ':id', component: CommissionShowComponent }
    ]
};


