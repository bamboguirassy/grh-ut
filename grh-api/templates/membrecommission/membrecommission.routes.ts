import { Route } from '@angular/router';
import { MembreCommissionListComponent } from './membrecommission-list/membrecommission-list.component';
import { MembreCommissionShowComponent } from './membrecommission-show/membrecommission-show.component';
import { MembreCommissionEditComponent } from './membrecommission-edit/membrecommission-edit.component';
import { MembreCommissionCloneComponent } from './membrecommission-clone/membrecommission-clone.component';

export const membreCommissionRoutes: Route = {
    path: 'membrecommission', children: [
        { path: '', component: MembreCommissionListComponent },
        { path: ':id/edit', component: MembreCommissionEditComponent },
        { path: ':id/clone', component: MembreCommissionCloneComponent },
        { path: ':id', component: MembreCommissionShowComponent }
    ]
};


// membrecommission components
MembreCommissionListComponent,
MembreCommissionEditComponent,
MembreCommissionShowComponent,
MembreCommissionCloneComponent,
MembreCommissionNewComponent,
