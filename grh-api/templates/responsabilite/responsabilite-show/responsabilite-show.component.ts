import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { ResponsabiliteService } from '../responsabilite.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { Responsabilite } from '../responsabilite';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-responsabilite-show',
  templateUrl: './responsabilite-show.component.html',
  styleUrls: ['./responsabilite-show.component.scss']
})
export class ResponsabiliteShowComponent extends BasePageComponent<Responsabilite> implements OnInit, OnDestroy {
  entity: Responsabilite;

  constructor(store: Store<IAppState>,
    public responsabiliteSrv: ResponsabiliteService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, responsabiliteSrv);
    this.pageData = {
      title: 'Détails - Responsabilite',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Responsabilites',
          route: '/'+this.orientation+'/responsabilite'
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
    this.title = 'Responsabilite - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
