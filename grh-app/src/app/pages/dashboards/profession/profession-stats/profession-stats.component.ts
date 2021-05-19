import { ChartDataset } from 'chart.js';
import { DashboardService } from 'src/app/pages/dashboards/dashboard.service';
import { DashboardBaseComponent } from 'src/app/shared/components/dashboard-base/dashboard-base.component';
import { BamboAbstractObject } from 'src/app/shared/classes/bambo-abstract-object';
import { Component, OnInit, Input } from '@angular/core';
import { ProfessionStats } from '../profession-stats';

@Component({
  selector: 'app-profession-stats',
  templateUrl: './profession-stats.component.html',
  styleUrls: ['./profession-stats.component.scss']
})
export class ProfessionStatsComponent extends DashboardBaseComponent<ProfessionStats> implements OnInit {
  @Input() canSwitchDiagramType: boolean = true;
  typeDiagrams: { value: string, title: string }[] = [
    { value: 'bar', title: 'Barre verticale' },
    { value: 'line', title: 'Courbe' },
  ];

  constructor(public dashboardSrv: DashboardService) {
    super(dashboardSrv);
    this.methodName = 'countByProfession';  }

  ngOnInit(): void {
    this.buildDiagram();
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
              labelString: 'Professions'
            }
          }
        },
        plugins: {
          title: {
            display: true,
            text: 'Nombre d\'employé par Profession'
          }
        }
        
    };
    this.chartLabels = this.rawChartData.map(r => r.profession?.nom);
    this.chartType = 'bar';
    this.chartLegend = true;
    this.chartPlugins = [];

    this.chartData = [
      { data: this.rawChartData.map(r => +r.nbreEmploye), label: 'Nombre employé' },
      { data: this.rawChartData.map(r => +r.nbrHomme), label: 'Homme' },
      { data: this.rawChartData.map(r => +r.nbrFemme), label: 'Femme' }
    ];
  }

}
