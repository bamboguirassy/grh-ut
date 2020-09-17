import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { GradeService } from '../grade.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { Grade } from '../grade';

@Component({
  selector: 'app-grade-clone',
  templateUrl: './grade-clone.component.html',
  styleUrls: ['./grade-clone.component.scss']
})
export class GradeCloneComponent extends BasePageComponent<Grade> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public gradeSrv: GradeService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, gradeSrv);
    this.pageData = {
      title: 'Clonage - Grade',
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
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.gradeSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: Grade) {
    this.gradeSrv.httpSrv.router.navigate([this.orientation,this.gradeSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

