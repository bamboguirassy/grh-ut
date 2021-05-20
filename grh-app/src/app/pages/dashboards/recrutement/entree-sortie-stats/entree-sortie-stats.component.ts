import { Component, Input, OnInit } from '@angular/core';
import { ChartDataset } from 'chart.js';
import { DashboardBaseComponent } from 'src/app/shared/components/dashboard-base/dashboard-base.component';
import { DashboardService } from '../../dashboard.service';

@Component({
  selector: 'app-entree-sortie-stats',
  templateUrl: './entree-sortie-stats.component.html',
  styleUrls: ['./entree-sortie-stats.component.scss']
})
export class EntreeSortieStatsComponent extends DashboardBaseComponent<any> implements OnInit {

  @Input() canSwitchDiagramType: boolean = true;
  typeDiagrams: { value: string, title: string }[] = [
    { value: 'bar', title: 'Barre verticale' },
    { value: 'line', title: 'Courbe' },
  ];

  constructor(
    public dashboardSrv: DashboardService
  ) {
    super(dashboardSrv);
    this.methodName = 'countEmployeByEntreeSortie';
  }

  ngOnInit(): void {
    this.buildDiagram();
  }

  setDataChart() {
    const chartData: ChartDataset[] = [];
    let annees = this.rawChartData.map((data) => data.annee);
    let groups = [
      { code: 'nombreRecrutement', label: 'Recrutement' },
      { code: 'nombreDemission', label: 'Démission' },
      { code: 'nombreDepartRetraite', label: 'Retraite' },
      { code: 'nombreMisAPied', label: 'Mis à pied' },
      { code: 'nombreExpirationContrat', label: 'Contrat expiré' },
    ]
    groups.forEach(group => {
      const arr: number[] = [];
      for (const chartData of this.rawChartData) {
        arr.push(+chartData[group.code]);
      }
      chartData.push({ data: arr, label: group.label });
    });

    this.chartOptions = {
      responsive: true,
      scales: {
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
            labelString: 'Années'
          }
        },
      },
      plugins: {
        title: {
          display: true,
          text: 'Évolution des entrées-sorties pour les 7 dernières années'
        }
      }

    };

    this.chartLabels = annees;
    this.chartType = 'bar';
    this.chartLegend = true;
    this.chartPlugins = [];
    this.chartData = chartData;
  }

}
