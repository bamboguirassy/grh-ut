import { Component, OnDestroy, OnInit, Type } from '@angular/core';

import { Store } from '@ngrx/store';
import { BasePageComponent } from '../../base-page';
import { IAppState } from '../../../interfaces/app-state';
import { HttpService } from '../../../services/http/http.service';
import { EmployeService } from '../../gestionemploye/employe/employe.service';
import { TypeEmploye } from '../../parametrage/typeemploye/typeemploye';
import { TypeEmployeService } from '../../parametrage/typeemploye/typeemploye.service';
import { finalize } from 'rxjs/operators';
import { DashboardService } from '../dashboard.service';

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
    { code: 'SR', title: 'Suivi des entrée-sortie ' },
    { code: 'GR', title: 'Répartition des employés selon les grades' },
    { code: 'EM', title: 'Suivi de la répartition des employés' },
    { code: 'SSDF', title: 'Suivi des statistiques sur les diplomes/formations' },
    { code: 'SSA', title: 'Statistiques selon l’age' },
  ];
  selectedStatType: { code: string, title: string };


  // custom types
  tabCountEmploye = [];


  handlePostLoad() {
  }

  constructor(
    store: Store<IAppState>,
    httpSv: HttpService,
    public dashboardSrv: DashboardService,
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
    // this.getData('assets/data/last-appointments.json', 'appointments', 'setLoaded');
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
    this.dashboardSrv.countByType()
      .subscribe((data: any) => {
        this.tabCountEmploye = data;
        this.setLoaded();
      }, error => {
        this.dashboardSrv.httpSrv.catchError(error);
      });
  }





}