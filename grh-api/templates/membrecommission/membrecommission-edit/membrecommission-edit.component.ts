import { Component, OnInit, OnDestroy } from '@angular/core';
import { MembreCommission } from '../membrecommission';
import { MembreCommissionService } from '../membrecommission.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-membrecommission-edit',
  templateUrl: './membrecommission-edit.component.html',
  styleUrls: ['./membrecommission-edit.component.scss']
})
export class MembreCommissionEditComponent extends BasePageComponent<MembreCommission> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public membreCommissionSrv: MembreCommissionService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, membreCommissionSrv);
    this.pageData = {
      title: 'Modification - MembreCommission',
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
          title: 'Modification'
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
  }

  prepareUpdate() {
  }

  handlePostUpdate() {
    this.location.back();
  }

}
