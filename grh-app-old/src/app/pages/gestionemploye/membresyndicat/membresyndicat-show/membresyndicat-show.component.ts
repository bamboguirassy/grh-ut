import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { MembreSyndicatService } from '../membresyndicat.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { MembreSyndicat } from '../membresyndicat';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-membresyndicat-show',
  templateUrl: './membresyndicat-show.component.html',
  styleUrls: ['./membresyndicat-show.component.scss']
})
export class MembreSyndicatShowComponent extends BasePageComponent<MembreSyndicat> implements OnInit, OnDestroy {
  entity: MembreSyndicat;

  constructor(store: Store<IAppState>,
    public membreSyndicatSrv: MembreSyndicatService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, membreSyndicatSrv);
    this.pageData = {
      title: 'Détails - MembreSyndicat',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'MembreSyndicats',
          route: '/'+this.orientation+'/membresyndicat'
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
    this.title = 'MembreSyndicat - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
