import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { MembreCommissionService } from '../membrecommission.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { MembreCommission } from '../membrecommission';

@Component({
  selector: 'app-membrecommission-clone',
  templateUrl: './membrecommission-clone.component.html',
  styleUrls: ['./membrecommission-clone.component.scss']
})
export class MembreCommissionCloneComponent extends BasePageComponent<MembreCommission> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public membreCommissionSrv: MembreCommissionService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, membreCommissionSrv);
    this.pageData = {
      title: 'Clonage - MembreCommission',
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
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.membreCommissionSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: MembreCommission) {
    this.membreCommissionSrv.httpSrv.router.navigate([this.orientation,this.membreCommissionSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

