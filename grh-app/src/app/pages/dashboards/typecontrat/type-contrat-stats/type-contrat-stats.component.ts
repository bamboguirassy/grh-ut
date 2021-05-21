import { Component, Input, OnInit } from '@angular/core';
import { DashboardBaseComponent } from 'src/app/shared/components/dashboard-base/dashboard-base.component';
import { DashboardService } from '../../dashboard.service';
import { TypeContratStats } from '../type-contrat-stats';

@Component({
  selector: 'app-type-contrat-stats',
  templateUrl: './type-contrat-stats.component.html',
  styleUrls: ['./type-contrat-stats.component.scss']
})
export class TypeContratStatsComponent extends DashboardBaseComponent<TypeContratStats> implements OnInit {
  @Input() canSwitchDiagramType: boolean = true;
  typeDiagrams: { value: string, title: string }[] = [
    { value: 'bar', title: 'Barre verticale' },
    { value: 'line', title: 'Courbe' },
  ];
  constructor(public dashboardSrv: DashboardService) { 
    super(dashboardSrv);
    this.methodName = 'countEmployeByTypeContrat';
   
  }

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
              labelString: 'Type Contrats Actif'
            }
          }
        },
        plugins: {
          title: {
            display: true,
            text: 'Nombres employé  par Type Contrat Actif'
          }
        }
        
    };
    this.chartLabels = this.rawChartData.map(r => r?.typeContrat?.code);
    this.chartType = 'bar';
    this.chartLegend = true;
    this.chartPlugins = [];

    this.chartData = [
      { data: this.rawChartData.map(r => +r.nbreEmploye), label: 'Nombre employés' },
    ];
  }

}
