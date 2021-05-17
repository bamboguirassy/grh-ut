import { Route } from '@angular/router';
import { OrganigrammeViewComponent } from './organigramme-view/organigramme-view.component';

export const organigrammeRoutes: Route = {
    path: 'organigramme', children: [
        { path: '', component: OrganigrammeViewComponent },
    ]
};



