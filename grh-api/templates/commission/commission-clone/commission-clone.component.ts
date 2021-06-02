import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { CommissionService } from '../commission.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { Commission } from '../commission';

@Component({
  selector: 'app-commission-clone',
  templateUrl: './commission-clone.component.html',
  styleUrls: ['./commission-clone.component.scss']
})
export class CommissionCloneComponent extends BasePageComponent<Commission> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public commissionSrv: CommissionService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, commissionSrv);
    this.pageData = {
      title: 'Clonage - Commission',
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
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.commissionSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: Commission) {
    this.commissionSrv.httpSrv.router.navigate([this.orientation,this.commissionSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

