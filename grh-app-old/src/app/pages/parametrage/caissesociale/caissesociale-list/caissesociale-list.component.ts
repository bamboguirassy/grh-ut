import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { CaisseSocialeService } from '../caissesociale.service';
import { CaisseSociale } from '../caissesociale';

@Component({
  selector: 'app-caissesociale-list',
  templateUrl: './caissesociale-list.component.html',
  styleUrls: ['./caissesociale-list.component.scss']
})
export class CaisseSocialeListComponent extends BasePageComponent<CaisseSociale> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public caisseSocialeSrv: CaisseSocialeService) {
    super(store, caisseSocialeSrv);

    this.pageData = {
      title: 'Liste des Caisses Sociales',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des caisses sociales'
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
