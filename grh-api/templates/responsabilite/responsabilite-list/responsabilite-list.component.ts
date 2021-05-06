import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { ResponsabiliteService } from '../responsabilite.service';
import { Responsabilite } from '../responsabilite';

@Component({
  selector: 'app-responsabilite-list',
  templateUrl: './responsabilite-list.component.html',
  styleUrls: ['./responsabilite-list.component.scss']
})
export class ResponsabiliteListComponent extends BasePageComponent<Responsabilite> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public responsabiliteSrv: ResponsabiliteService) {
    super(store, responsabiliteSrv);

    this.pageData = {
      title: 'Liste des Responsabilites',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des responsabilites'
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
