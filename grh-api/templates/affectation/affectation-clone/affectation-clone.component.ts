import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { AffectationService } from '../affectation.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { Affectation } from '../affectation';

@Component({
  selector: 'app-affectation-clone',
  templateUrl: './affectation-clone.component.html',
  styleUrls: ['./affectation-clone.component.scss']
})
export class AffectationCloneComponent extends BasePageComponent<Affectation> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public affectationSrv: AffectationService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, affectationSrv);
    this.pageData = {
      title: 'Clonage - Affectation',
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
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.affectationSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: Affectation) {
    this.affectationSrv.httpSrv.router.navigate([this.orientation,this.affectationSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

