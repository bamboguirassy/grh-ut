import { Route } from '@angular/router';
import { MembreCommissionListComponent } from './membrecommission-list/membrecommission-list.component';
import { MembreCommissionShowComponent } from './membrecommission-show/membrecommission-show.component';
import { MembreCommissionEditComponent } from './membrecommission-edit/membrecommission-edit.component';

export const membreCommissionRoutes: Route = {
    path: 'membrecommission', children: [
        { path: '', component: MembreCommissionListComponent },
        { path: ':id/edit', component: MembreCommissionEditComponent },
        { path: ':id', component: MembreCommissionShowComponent }
    ]
};


