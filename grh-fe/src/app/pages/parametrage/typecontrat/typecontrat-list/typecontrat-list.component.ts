import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { TypeContratService } from '../typecontrat.service';
import { TypeContrat } from '../typecontrat';

@Component({
  selector: 'app-typecontrat-list',
  templateUrl: './typecontrat-list.component.html',
  styleUrls: ['./typecontrat-list.component.scss']
})
export class TypeContratListComponent extends BasePageComponent<TypeContrat> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public typeContratSrv: TypeContratService) {
    super(store, typeContratSrv);

    this.pageData = {
      title: 'Liste des Types de Contrat',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des types de contrat'
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
