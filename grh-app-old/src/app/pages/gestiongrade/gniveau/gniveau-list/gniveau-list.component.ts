import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { GNiveauService } from '../gniveau.service';
import { GNiveau } from '../gniveau';

@Component({
  selector: 'app-gniveau-list',
  templateUrl: './gniveau-list.component.html',
  styleUrls: ['./gniveau-list.component.scss']
})
export class GNiveauListComponent extends BasePageComponent<GNiveau> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public gNiveauSrv: GNiveauService) {
    super(store, gNiveauSrv);

    this.pageData = {
      title: 'Liste des Niveaux',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des niveaux'
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
