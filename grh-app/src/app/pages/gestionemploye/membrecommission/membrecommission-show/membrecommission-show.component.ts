import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { MembreCommissionService } from '../membrecommission.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { MembreCommission } from '../membrecommission';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-membrecommission-show',
  templateUrl: './membrecommission-show.component.html',
  styleUrls: ['./membrecommission-show.component.scss']
})
export class MembreCommissionShowComponent extends BasePageComponent<MembreCommission> implements OnInit, OnDestroy {
  entity: MembreCommission;

  constructor(store: Store<IAppState>,
    public membreCommissionSrv: MembreCommissionService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, membreCommissionSrv);
    this.pageData = {
      title: 'Détails - MembreCommission',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'MembreCommissions',
          route: '/'+this.orientation+'/membrecommission'
        },
        {
          title: 'Affichage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findEntity(this.activatedRoute.snapshot.params.id);
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.title = 'MembreCommission - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
