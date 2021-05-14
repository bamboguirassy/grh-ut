import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { ContratService } from '../contrat.service';
import { Contrat } from '../contrat';

@Component({
  selector: 'app-contrat-list',
  templateUrl: './contrat-list.component.html',
  styleUrls: ['./contrat-list.component.scss']
})
export class ContratListComponent extends BasePageComponent<Contrat> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public contratSrv: ContratService) {
    super(store, contratSrv);

    this.pageData = {
      title: 'Liste des Contrats',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des contrats'
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
