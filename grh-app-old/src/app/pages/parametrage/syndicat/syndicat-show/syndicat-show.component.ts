import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { SyndicatService } from '../syndicat.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { Syndicat } from '../syndicat';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-syndicat-show',
  templateUrl: './syndicat-show.component.html',
  styleUrls: ['./syndicat-show.component.scss']
})
export class SyndicatShowComponent extends BasePageComponent<Syndicat> implements OnInit, OnDestroy {
  entity: Syndicat;

  constructor(store: Store<IAppState>,
    public syndicatSrv: SyndicatService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, syndicatSrv);
    this.pageData = {
      title: 'Détails - Syndicat',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Syndicats',
          route: '/'+this.orientation+'/syndicat'
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
    this.title = 'Syndicat - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
