import { Component, OnDestroy, OnInit, Type } from '@angular/core';

import { Store } from '@ngrx/store';
import { EChartOption } from 'echarts';
import { BasePageComponent } from '../../base-page';
import { IAppState } from '../../../interfaces/app-state';
import { HttpService } from '../../../services/http/http.service';
import { EmployeService } from '../../gestionemploye/employe/employe.service';
import { TypeEmploye } from '../../parametrage/typeemploye/typeemploye';
import { TypeEmployeService } from '../../parametrage/typeemploye/typeemploye.service';
import { finalize } from 'rxjs/operators';
import { ChartDataSets, ChartOptions, ChartType } from 'chart.js';
import { Label } from 'ng2-charts';

@Component({
  selector: 'page-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class PageDashboardComponent extends BasePageComponent<any> implements OnInit, OnDestroy {
  typeEmployes: TypeEmploye[] = [];
  selectedTypeEmploye: TypeEmploye[] = [];
  fetching = false;
  statTypes: { code: string, title: string }[] = [
    { code: 'SR', title: 'Suivi des recrutements' }
  ];
  selectedStatType: { code: string, title: string };


  // custom types
  tabCountEmploye = [];


  handlePostLoad() {
  }

  constructor(
    store: Store<IAppState>,
    httpSv: HttpService,
    public employeSrv: EmployeService,
    public typeEmployeSrv: TypeEmployeService,
  ) {
    super(store, httpSv);

    this.pageData = {
      title: 'Tableau de bord',
      loaded: false,
      breadcrumbs: [
        {
          title: 'Tableau de bord',
          route: 'default-dashboard'
        },
        {
          title: 'Global'
        }
      ]
    };
  }

  ngOnInit() {
    super.ngOnInit();
    this.getEmployeCountStatistics();
    this.getData('assets/data/last-appointments.json', 'appointments', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  fetchTypeEmployes() {
    if (!this.typeEmployes.length) {
      this.fetching = true;
      this
        .typeEmployeSrv
        .findAll()
        .pipe(
          finalize(() => this.fetching = false)
        ).subscribe((typeEmployes: any) => {
          this.typeEmployes = typeEmployes;
        }, error => {
          this.typeEmployeSrv.httpSrv.catchError(error);
        });
    }
  }


  getEmployeCountStatistics() {
    this.employeSrv.countByType()
      .subscribe((data: any) => {
        this.tabCountEmploye = data;
      }, error => {
        this.employeSrv.httpSrv.catchError(error);
      });
  }





}
