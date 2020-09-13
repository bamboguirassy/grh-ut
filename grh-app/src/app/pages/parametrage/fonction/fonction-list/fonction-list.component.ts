import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { FonctionService } from '../fonction.service';
import { Fonction } from '../fonction';

@Component({
  selector: 'app-fonction-list',
  templateUrl: './fonction-list.component.html',
  styleUrls: ['./fonction-list.component.scss']
})
export class FonctionListComponent extends BasePageComponent<Fonction> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public fonctionSrv: FonctionService) {
    super(store, fonctionSrv);

    this.pageData = {
      title: 'Liste des Fonctions',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des fonctions'
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
