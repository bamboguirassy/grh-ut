import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { DiplomeEmployeService } from '../diplomeemploye.service';
import { DiplomeEmploye } from '../diplomeemploye';

@Component({
  selector: 'app-diplomeemploye-list',
  templateUrl: './diplomeemploye-list.component.html',
  styleUrls: ['./diplomeemploye-list.component.scss']
})
export class DiplomeEmployeListComponent extends BasePageComponent<DiplomeEmploye> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public diplomeEmployeSrv: DiplomeEmployeService) {
    super(store, diplomeEmployeSrv);

    this.pageData = {
      title: 'Liste des DiplomeEmployes',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des diplomeemployes'
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
