import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { GradeService } from '../grade.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { Grade } from '../grade';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-grade-show',
  templateUrl: './grade-show.component.html',
  styleUrls: ['./grade-show.component.scss']
})
export class GradeShowComponent extends BasePageComponent<Grade> implements OnInit, OnDestroy {
  entity: Grade;

  constructor(store: Store<IAppState>,
    public gradeSrv: GradeService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, gradeSrv);
    this.pageData = {
      title: 'Détails - Grade',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Grades',
          route: '/'+this.orientation+'/grade'
        },
        {
          title: 'Affichage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findEntity(this.activatedRoute.snapshot.params.id);
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.title = 'Grade - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
