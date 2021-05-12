import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { TypeEntiteService } from '../typeentite.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { TypeEntite } from '../typeentite';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-typeentite-show',
  templateUrl: './typeentite-show.component.html',
  styleUrls: ['./typeentite-show.component.scss']
})
export class TypeEntiteShowComponent extends BasePageComponent<TypeEntite> implements OnInit, OnDestroy {
  entity: TypeEntite;

  constructor(store: Store<IAppState>,
    public typeEntiteSrv: TypeEntiteService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, typeEntiteSrv);
    this.pageData = {
      title: 'Détails - TypeEntite',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'TypeEntites',
          route: '/'+this.orientation+'/typeentite'
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
    this.title = 'TypeEntite - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
