
import { Route } from '@angular/router';
import { ContratEnExpirationComponent } from './contrat-en-expiration/contrat-en-expiration.component';

export const contratRoutes: Route = {
    path: 'contrat-en-expiration', children: [
        { path: '', component: ContratEnExpirationComponent },
        
    ]
};