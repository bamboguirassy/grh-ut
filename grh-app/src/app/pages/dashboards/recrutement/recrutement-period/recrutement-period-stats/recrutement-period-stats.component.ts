import { RecrutementPeriodStats } from './../recrutement-period-stats';
import { finalize } from 'rxjs/operators';
import { DashboardService } from 'src/app/pages/dashboards/dashboard.service';
import { Component, OnInit, Input } from '@angular/core';
import { DashboardBaseComponent } from 'src/app/shared/components/dashboard-base/dashboard-base.component';

@Component({
  selector: 'app-recrutement-period-stats',
  templateUrl: './recrutement-period-stats.component.html',
  styleUrls: ['./recrutement-period-stats.component.scss']
})
export class RecrutementPeriodStatsComponent extends DashboardBaseComponent<RecrutementPeriodStats> implements OnInit {
  isLoad = false;
  @Input() canSwitchDiagramType: boolean = true;
  typeDiagrams: { value: string, title: string }[] = [
    { value: 'bar', title: 'Barre verticale' },
    { value: 'line', title: 'Courbe' },
  ];
  date: Date;
  rawChartData: RecrutementPeriodStats[];
  constructor(public dashboardSrv: DashboardService) {
    super(dashboardSrv);
  }

  ngOnInit(): void {
    
  }

  setDataChart() {
    this.chartOptions = {
      responsive: true,
        scales: { //you're missing this
          yAxes: {
            display: true,
            scaleLabel: {
              display: true,
              labelString: 'Nombres'
            }
          },
          xAxes: {
            display: true,
            scaleLabel: {
              display: true,
              labelString: 'Types Employés'
            }
          }
        },
        plugins: {
          title: {
            display: true,
            text: 'Nombres employés recrutés par genre par Type Employé'
          }
        }
        
    };
    this.chartLabels = this.rawChartData.map(r => r.typeEmploye?.code);
    this.chartType = 'bar';
    this.chartLegend = true;
    this.chartPlugins = [];

    this.chartData = [
      { data: this.rawChartData.map(r => +r.nbrHomme), label: 'Homme' },
      { data: this.rawChartData.map(r => +r.nbrFemme), label: 'Femme' }
    ];
  }

  buildDiagram() {
    this.loading = true;
    this.dashboardSrv.countEmployeByPeriod(this.date)
      .pipe(finalize(() => this.loading = false))
      .subscribe((data: any) => {
        this.isLoad = true;
        this.handlePostFetch(data as RecrutementPeriodStats[]);
      }, err => {
        this.httpSrv.httpSrv.handleError(err);
      });
  }
  
}
