import { Component, OnInit, OnDestroy } from '@angular/core';
import { Commission } from '../commission';
import { CommissionService } from '../commission.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { DatePipe, Location } from '@angular/common';

@Component({
  selector: 'app-commission-edit',
  templateUrl: './commission-edit.component.html',
  styleUrls: ['./commission-edit.component.scss']
})
export class CommissionEditComponent extends BasePageComponent<Commission> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
    public commissionSrv: CommissionService,
    public router: Router,
    private activatedRoute: ActivatedRoute,
    public location: Location, public datePipe: DatePipe) {
    super(store, commissionSrv);
    this.pageData = {
      title: 'Modification - Commission',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des commissions',
          route: '/' + this.orientation + '/commission'
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
  update(){
    this.entity.dateCreation = this.datePipe.transform(this.entity.dateCreation, 'yyyy-MM-dd');
    super.update();
  }

}
