import { Component, Input, OnInit } from '@angular/core';
import { ChartDataset } from 'chart.js';
import { DashboardBaseComponent } from 'src/app/shared/components/dashboard-base/dashboard-base.component';
import { DashboardService } from '../../dashboard.service';

@Component({
  selector: 'app-demission-employe-structure-annee-stats',
  templateUrl: './demission-employe-structure-annee-stats.component.html',
  styleUrls: ['./demission-employe-structure-annee-stats.component.scss']
})
export class DemissionEmployeStructureAnneeStatsComponent extends DashboardBaseComponent<any> implements OnInit {

  @Input() canSwitchDiagramType: boolean = true;
  typeDiagrams: { value: string, title: string }[] = [
    { value: 'bar', title: 'Barre verticale' },
    { value: 'line', title: 'Courbe' },
  ];

  constructor(
    public dashboardSrv: DashboardService
  ) {
    super(dashboardSrv);
    this.methodName = 'countDemissionEmployeByStructureAnnee';
  }

  ngOnInit(): void {
    this.buildDiagram();
  }

  setDataChart() {
    const chartData: ChartDataset[] = [];
    let structures = this.rawChartData.structures.map((data) => data.code);
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
            labelString: 'Structures'
          }
        },
      },
      plugins: {
        title: {
          display: true,
          text: 'Évolution des démissions par structure / année'
        }
      }
    };
    this.chartLabels = structures;
    this.chartType = 'bar';
    this.chartLegend = true;
    this.chartPlugins = [];
    this.chartData = chartData;
  }

}
