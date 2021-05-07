import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { GEchelonService } from '../gechelon.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { GEchelon } from '../gechelon';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-gechelon-show',
  templateUrl: './gechelon-show.component.html',
  styleUrls: ['./gechelon-show.component.scss']
})
export class GEchelonShowComponent extends BasePageComponent<GEchelon> implements OnInit, OnDestroy {
  entity: GEchelon;

  constructor(store: Store<IAppState>,
    public gEchelonSrv: GEchelonService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, gEchelonSrv);
    this.pageData = {
      title: 'Détails - GEchelon',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des géchelons',
          route: '/'+this.orientation+'/gechelon'
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
    this.title = 'GEchelon - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
