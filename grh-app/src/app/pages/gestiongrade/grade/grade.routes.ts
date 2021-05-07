import { Route } from '@angular/router';
import { GradeListComponent } from './grade-list/grade-list.component';
import { GradeShowComponent } from './grade-show/grade-show.component';
import { GradeEditComponent } from './grade-edit/grade-edit.component';

export const gradeRoutes: Route = {
    path: 'grade', children: [
        { path: '', component: GradeListComponent },
        { path: ':id/edit', component: GradeEditComponent },
        { path: ':id', component: GradeShowComponent }
    ]
};
