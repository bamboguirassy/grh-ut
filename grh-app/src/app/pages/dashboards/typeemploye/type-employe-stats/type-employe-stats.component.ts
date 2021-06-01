import { Component, Input, OnInit } from '@angular/core';
import { DashboardBaseComponent } from 'src/app/shared/components/dashboard-base/dashboard-base.component';
import { DashboardService } from '../../dashboard.service';
import { TypeEmployeStats } from '../type-employe-stats';

@Component({
  selector: 'app-type-employe-stats',
  templateUrl: './type-employe-stats.component.html',
  styleUrls: ['./type-employe-stats.component.scss']
})
export class TypeEmployeStatsComponent extends DashboardBaseComponent<TypeEmployeStats> implements OnInit {
  @Input() canSwitchDiagramType: boolean = true;
  typeDiagrams: { value: string, title: string }[] = [
    { value: 'bar', title: 'Barre verticale' },
    { value: 'line', title: 'Courbe' },
  ];
  constructor(public dashboardSrv: DashboardService) { 
    super(dashboardSrv);
    this.methodName = 'countEmployeByTypeEmploye'; 
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
              labelString: "Nombre d'employés"
            }
          },
          xAxes: {
            display: true,
            scaleLabel: {
              display: true,
              labelString: 'Type Employes'
            }
          }
        },
        plugins: {
          title: {
            display: true,
            text: 'Nombres employé / Homme / Femme par Type Employe'
          }
        }
        
    };
    this.chartLabels = this.rawChartData.map(r => r?.typeEmploye?.code);
    this.chartType = 'bar';
    this.chartLegend = true;
    this.chartPlugins = [];

    this.chartData = [
      { data: this.rawChartData.map(r => +r.nbrHomme), label: 'Homme' },
      { data: this.rawChartData.map(r => +r.nbrFemme), label: 'Femme' }
    ];
  }

}
