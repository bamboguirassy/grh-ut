import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { GCategorieService } from '../gcategorie.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { GCategorie } from '../gcategorie';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-gcategorie-show',
  templateUrl: './gcategorie-show.component.html',
  styleUrls: ['./gcategorie-show.component.scss']
})
export class GCategorieShowComponent extends BasePageComponent<GCategorie> implements OnInit, OnDestroy {
  entity: GCategorie;

  constructor(store: Store<IAppState>,
    public gCategorieSrv: GCategorieService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, gCategorieSrv);
    this.pageData = {
      title: 'Détails - categorie',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des categories',
          route: '/'+this.orientation+'/gcategorie'
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
    this.title = 'Categorie - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
