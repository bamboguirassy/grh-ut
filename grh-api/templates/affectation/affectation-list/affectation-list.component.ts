import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { AffectationService } from '../affectation.service';
import { Affectation } from '../affectation';

@Component({
  selector: 'app-affectation-list',
  templateUrl: './affectation-list.component.html',
  styleUrls: ['./affectation-list.component.scss']
})
export class AffectationListComponent extends BasePageComponent<Affectation> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public affectationSrv: AffectationService) {
    super(store, affectationSrv);

    this.pageData = {
      title: 'Liste des Affectations',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des affectations'
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
