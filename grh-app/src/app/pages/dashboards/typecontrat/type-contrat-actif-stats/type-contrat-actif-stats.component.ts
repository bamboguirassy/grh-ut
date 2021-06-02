import { Component, Input, OnInit } from '@angular/core';
import { DashboardBaseComponent } from 'src/app/shared/components/dashboard-base/dashboard-base.component';
import { DashboardService } from '../../dashboard.service';
import { TypeContratActifStats } from './type-contrat-actif-stats';

@Component({
  selector: 'app-type-contrat-actif-stats',
  templateUrl: './type-contrat-actif-stats.component.html',
  styleUrls: ['./type-contrat-actif-stats.component.scss']
})
export class TypeContratActifStatsComponent extends DashboardBaseComponent<TypeContratActifStats> implements OnInit {

  @Input() canSwitchDiagramType: boolean = true;
  typeDiagrams: { value: string, title: string }[] = [
    { value: 'bar', title: 'Barre verticale' },
    { value: 'line', title: 'Courbe' },
  ];
  constructor(public dashboardSrv: DashboardService) { 
    super(dashboardSrv);
    this.methodName = 'countEmployeByTypeContratActif';
   
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
              labelString: 'Type Contrats'
            }
          }
        },
        plugins: {
          title: {
            display: true,
            text: 'Nombres employé  par Type Contrat (Contrats Actifs)'
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
