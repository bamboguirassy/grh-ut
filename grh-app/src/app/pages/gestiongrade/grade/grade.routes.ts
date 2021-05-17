import { Route } from '@angular/router';
import { GradeManagerComponent } from './grade-manager/grade-manager.component';

export const gradeRoutes: Route = {
    path: 'grade', children: [
        { path: '', component: GradeManagerComponent }
    ]
};
