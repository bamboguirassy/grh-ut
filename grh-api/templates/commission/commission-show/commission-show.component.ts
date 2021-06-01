import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { CommissionService } from '../commission.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { Commission } from '../commission';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-commission-show',
  templateUrl: './commission-show.component.html',
  styleUrls: ['./commission-show.component.scss']
})
export class CommissionShowComponent extends BasePageComponent<Commission> implements OnInit, OnDestroy {
  entity: Commission;

  constructor(store: Store<IAppState>,
    public commissionSrv: CommissionService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, commissionSrv);
    this.pageData = {
      title: 'Détails - Commission',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Commissions',
          route: '/'+this.orientation+'/commission'
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
    this.title = 'Commission - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
