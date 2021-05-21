import { Component, Input, OnInit } from '@angular/core';
import { DashboardBaseComponent } from 'src/app/shared/components/dashboard-base/dashboard-base.component';
import { DashboardService } from '../../dashboard.service';
import { AncienneteEmployeCM } from '../anciennete-employe-cm';

@Component({
  selector: 'app-anciennete-employe',
  templateUrl: './anciennete-employe.component.html',
  styleUrls: ['./anciennete-employe.component.scss']
})
export class AncienneteEmployeComponent extends DashboardBaseComponent<AncienneteEmployeCM> implements OnInit {

  @Input() canSwitchDiagramType: boolean = true;
  typeDiagrams: { value: string, title: string }[] = [
    { value: 'bar', title: 'Barre verticale' },
    // { value: 'pie', title: 'Pie' },
    { value: 'line', title: 'Courbe' },
  ];

  constructor(
    public dashboardSrv: DashboardService
  ) {
    super(dashboardSrv);
    this.methodName = 'getSeniorityStats';
   }

  ngOnInit(): void {
    this.buildDiagram();
  }

  setDataChart() {
    const chartData = [{ data: this.rawChartData.map(r => +r.nombreEmploye), label: 'Effectif' }];
    const typeEmployes = this.rawChartData[0].categories.map((r) => ({ code: r?.typeEmploye?.code, label: r?.typeEmploye?.nom }));
    for (const te of typeEmployes) {
      const arr: number[] = [];
      for (const chartData of this.rawChartData) {
        for (const dataItem of chartData.categories) {
          if (te.code === dataItem.typeEmploye.code) {
            arr.push(+dataItem.nombreEmploye);
          }
        }
      }
      chartData.push({ data: arr, label: te.code });
    }
    this.chartOptions = {
      responsive: true,
        scales: { 
          yAxes: {
            display: true,
            scaleLabel: {
              display: true,
              labelString: 'Nombre'
            }
          },
          xAxes: {
            display: true,
            scaleLabel: {
              display: true,
              labelString: 'Intervalles d\'années'
            }
          }
        },
        plugins: {
          title: {
            display: true,
            text: "Suivi de l'ancienneté des employés"
          }
        }
        
    };
    this.chartLabels = this.rawChartData.map(r => r?.anciennete);
    this.chartType = 'bar';
    this.chartLegend = true;
    this.chartPlugins = [];

    this.chartData = chartData;

  }

}
