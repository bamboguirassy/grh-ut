import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { GCategorieService } from '../gcategorie.service';
import { GCategorie } from '../gcategorie';

@Component({
  selector: 'app-gcategorie-list',
  templateUrl: './gcategorie-list.component.html',
  styleUrls: ['./gcategorie-list.component.scss']
})
export class GCategorieListComponent extends BasePageComponent<GCategorie> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public gCategorieSrv: GCategorieService) {
    super(store, gCategorieSrv);

    this.pageData = {
      title: 'Liste des GCategories',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des gcategories'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findAll();
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostDelete() {
    this.findAll();
  }

  handlePostLoad(){}

}
