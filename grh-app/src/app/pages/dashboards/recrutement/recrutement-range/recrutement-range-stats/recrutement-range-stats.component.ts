import {DashboardBaseComponent} from '../../../../../shared/components/dashboard-base/dashboard-base.component';
import { finalize } from 'rxjs/operators';
import { DashboardService } from 'src/app/pages/dashboards/dashboard.service';
import { RecrutementRangeStats } from './../recrutement-range-stats';
import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-recrutement-range-stats',
  templateUrl: './recrutement-range-stats.component.html',
  styleUrls: ['./recrutement-range-stats.component.scss']
})
export class RecrutementRangeStatsComponent extends DashboardBaseComponent<RecrutementRangeStats> implements OnInit {
  @Input() canSwitchDiagramType: boolean = true;
  typeDiagrams: { value: string, title: string }[] = [
    { value: 'bar', title: 'Barre verticale' },
    { value: 'line', title: 'Courbe' },
  ];
  dateDebut: Date;
  dateFin: Date;
  isLoad = false;
  rawChartData: RecrutementRangeStats[];
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
              labelString: "Nombre d'employés"
            }
          },
          xAxes: {
            display: true,
            scaleLabel: {
              display: true,
              labelString: 'Types Employé'
            }
          }
        },
        plugins: {
          title: {
            display: true,
            text: 'Nombres employés recrutés par genre par Type Employé du '+this.dateDebut+' à '+this.dateFin
          }
        }
        
    };
    this.chartLabels = this.rawChartData.map(r => r.typeEmploye?.code);
    this.chartType = 'bar';
    this.chartLegend = true;
    this.chartPlugins = [];

    this.chartData = [
      { data: this.rawChartData.map(r => +r.nbreEmploye), label: 'Nombres employé' },
      { data: this.rawChartData.map(r => +r.nbrHomme), label: 'Homme' },
      { data: this.rawChartData.map(r => +r.nbrFemme), label: 'Femme' }
    ];
  }

  buildDiagram() {
    this.loading = true;
    this.dashboardSrv.countEmployeByDateRange(this.dateDebut,this.dateFin)
      .pipe(finalize(() => this.loading = false))
      .subscribe((data: any) => {
        this.isLoad = true;
        this.handlePostFetch(data as RecrutementRangeStats[]);
      }, err => {
        this.httpSrv.httpSrv.handleError(err);
      });
  }


}
