import { Component, Input, OnInit } from '@angular/core';
import { DashboardBaseComponent } from 'src/app/shared/components/dashboard-base/dashboard-base.component';
import { DashboardService } from '../../dashboard.service';
import { AnciennetePerGenreCm } from '../anciennete-per-genre-cm';

@Component({
  selector: 'app-anciennete-per-genre',
  templateUrl: './anciennete-per-genre.component.html',
  styleUrls: ['./anciennete-per-genre.component.scss']
})
export class AnciennetePerGenreComponent extends DashboardBaseComponent<AnciennetePerGenreCm>  implements OnInit {
  @Input() canSwitchDiagramType: boolean = true;
  typeDiagrams: { value: string, title: string }[] = [
    { value: 'bar', title: 'Barre verticale' },
    { value: 'line', title: 'Courbe' },
  ];
  constructor(public dashboardSrv: DashboardService) {
    super(dashboardSrv);
    this.methodName = 'getEmployeByPerStats';
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
              labelString: 'Plages'
            }
          }
        },
        plugins: {
          title: {
            display: true,
            text: 'Nombres employé Per'
          }
        }
        
    };
    this.chartLabels = this.rawChartData.map(r => r.anciennete);
    this.chartType = 'bar';
    this.chartLegend = true;
    this.chartPlugins = [];

    this.chartData = [
      { data: this.rawChartData.map(r => +r.nombreEmployeHomme), label: 'Homme' },
      { data: this.rawChartData.map(r => +r.nombreEmployeFemme), label: 'Femme' }
    ];
  }

}
