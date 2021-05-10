import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { AffectationService } from '../affectation.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { Affectation } from '../affectation';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-affectation-show',
  templateUrl: './affectation-show.component.html',
  styleUrls: ['./affectation-show.component.scss']
})
export class AffectationShowComponent extends BasePageComponent<Affectation> implements OnInit, OnDestroy {
  entity: Affectation;

  constructor(store: Store<IAppState>,
    public affectationSrv: AffectationService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, affectationSrv);
    this.pageData = {
      title: 'Détails - Affectation',
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
    this.title = 'Affectation - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
