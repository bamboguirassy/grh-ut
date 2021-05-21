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

    this.chartData = [
      { data: this.rawChartData.map(r => +r.nombreEmploye), label: 'Effectif' },
    ];
  }

}
