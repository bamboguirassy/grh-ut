import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { TypeEntiteService } from '../typeentite.service';
import { TypeEntite } from '../typeentite';

@Component({
  selector: 'app-typeentite-list',
  templateUrl: './typeentite-list.component.html',
  styleUrls: ['./typeentite-list.component.scss']
})
export class TypeEntiteListComponent extends BasePageComponent<TypeEntite> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public typeEntiteSrv: TypeEntiteService) {
    super(store, typeEntiteSrv);

    this.pageData = {
      title: 'Liste des Types Entités',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des types entités'
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
