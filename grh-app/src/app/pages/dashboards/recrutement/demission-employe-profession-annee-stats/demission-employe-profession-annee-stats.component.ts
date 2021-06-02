import { Component, Input, OnInit } from '@angular/core';
import { ChartDataset } from 'chart.js';
import { DashboardBaseComponent } from 'src/app/shared/components/dashboard-base/dashboard-base.component';
import { DashboardService } from '../../dashboard.service';

@Component({
  selector: 'app-demission-employe-profession-annee-stats',
  templateUrl: './demission-employe-profession-annee-stats.component.html',
  styleUrls: ['./demission-employe-profession-annee-stats.component.scss']
})
export class DemissionEmployeProfessionAnneeStatsComponent extends DashboardBaseComponent<any> implements OnInit {

  @Input() canSwitchDiagramType: boolean = true;
  typeDiagrams: { value: string, title: string }[] = [
    { value: 'bar', title: 'Barre verticale' },
    { value: 'line', title: 'Courbe' },
  ];

  constructor(
    public dashboardSrv: DashboardService
  ) {
    super(dashboardSrv);
    this.methodName = 'countDemissionEmployeByProfessionAnnee';
  }

  ngOnInit(): void {
    this.buildDiagram();
  }

  setDataChart() {
    const chartData: ChartDataset[] = [];
    let professions = this.rawChartData.professions.map((data) => data.nom);
    this.rawChartData.anneeData.forEach((chartDataItem) => {
      const arr: number[] = chartDataItem.data;
      chartData.push({ data: arr, label: chartDataItem.annee });
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
            labelString: 'Professions'
          }
        },
      },
      plugins: {
        title: {
          display: true,
          text: 'Évolution des démissions par profession / année'
        }
      }
    };
    this.chartLabels = professions;
    this.chartType = 'bar';
    this.chartLegend = true;
    this.chartPlugins = [];
    this.chartData = chartData;
  }

}
