import { Component, OnInit, Input } from '@angular/core';
import { DashboardBaseComponent } from 'src/app/shared/components/dashboard-base/dashboard-base.component';
import { DashboardService } from '../../dashboard.service';
import { DiplomeStats } from '../diplome-stats';

@Component({
  selector: 'app-diplome-stats',
  templateUrl: './diplome-stats.component.html',
  styleUrls: ['./diplome-stats.component.scss']
})
export class DiplomeStatsComponent extends DashboardBaseComponent<DiplomeStats>  implements OnInit {
  @Input() canSwitchDiagramType: boolean = true;
  typeDiagrams: { value: string, title: string }[] = [
    { value: 'bar', title: 'Barre verticale' },
    { value: 'line', title: 'Courbe' },
  ];
  constructor(public dashboardSrv: DashboardService) {
    super(dashboardSrv);
    this.methodName = 'countEmployeByDiplome'; 
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
              labelString: 'Diplomes'
            }
          }
        },
        plugins: {
          title: {
            display: true,
            text: 'Nombres employés par Diplome'
          }
        }
        
    };
    this.chartLabels = this.rawChartData.map(r => r.diplome?.nom);
    this.chartType = 'bar';
    this.chartLegend = true;
    this.chartPlugins = [];

    this.chartData = [
      { data: this.rawChartData.map(r => +r.nbreEmploye), label: 'Nombres employés' }
    ];
  }
}
