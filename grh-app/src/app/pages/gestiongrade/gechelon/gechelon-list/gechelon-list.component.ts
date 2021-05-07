import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { GEchelonService } from '../gechelon.service';
import { GEchelon } from '../gechelon';

@Component({
  selector: 'app-gechelon-list',
  templateUrl: './gechelon-list.component.html',
  styleUrls: ['./gechelon-list.component.scss']
})
export class GEchelonListComponent extends BasePageComponent<GEchelon> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public gEchelonSrv: GEchelonService) {
    super(store, gEchelonSrv);

    this.pageData = {
      title: 'Liste des GEchelons',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des géchelons'
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
