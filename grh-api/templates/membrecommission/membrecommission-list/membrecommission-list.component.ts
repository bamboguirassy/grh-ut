import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { MembreCommissionService } from '../membrecommission.service';
import { MembreCommission } from '../membrecommission';

@Component({
  selector: 'app-membrecommission-list',
  templateUrl: './membrecommission-list.component.html',
  styleUrls: ['./membrecommission-list.component.scss']
})
export class MembreCommissionListComponent extends BasePageComponent<MembreCommission> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public membreCommissionSrv: MembreCommissionService) {
    super(store, membreCommissionSrv);

    this.pageData = {
      title: 'Liste des MembreCommissions',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des membrecommissions'
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
