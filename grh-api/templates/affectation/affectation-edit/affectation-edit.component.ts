import { Component, OnInit, OnDestroy } from '@angular/core';
import { Affectation } from '../affectation';
import { AffectationService } from '../affectation.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-affectation-edit',
  templateUrl: './affectation-edit.component.html',
  styleUrls: ['./affectation-edit.component.scss']
})
export class AffectationEditComponent extends BasePageComponent<Affectation> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public affectationSrv: AffectationService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, affectationSrv);
    this.pageData = {
      title: 'Modification - Affectation',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Affectations',
          route: '/'+this.orientation+'/affectation'
        },
        {
          title: 'Modification'
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
  }

  prepareUpdate() {
  }

  handlePostUpdate() {
    this.location.back();
  }

}
