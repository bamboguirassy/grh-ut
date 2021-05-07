import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { DiplomeService } from '../diplome.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { Diplome } from '../diplome';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-diplome-show',
  templateUrl: './diplome-show.component.html',
  styleUrls: ['./diplome-show.component.scss']
})
export class DiplomeShowComponent extends BasePageComponent<Diplome> implements OnInit, OnDestroy {
  entity: Diplome;

  constructor(store: Store<IAppState>,
    public diplomeSrv: DiplomeService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, diplomeSrv);
    this.pageData = {
      title: 'Détails - Diplome',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des diplomes',
          route: '/'+this.orientation+'/diplome'
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
    this.title = 'Diplome - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
