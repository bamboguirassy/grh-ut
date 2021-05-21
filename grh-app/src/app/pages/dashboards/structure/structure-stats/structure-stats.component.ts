import { DashboardService } from 'src/app/pages/dashboards/dashboard.service';
import { StructureStats } from './../structure-stats';
import { DashboardBaseComponent } from 'src/app/shared/components/dashboard-base/dashboard-base.component';
import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-structure-stats',
  templateUrl: './structure-stats.component.html',
  styleUrls: ['./structure-stats.component.scss']
})
export class StructureStatsComponent extends DashboardBaseComponent<StructureStats> implements OnInit {
  @Input() canSwitchDiagramType: boolean = true;
  typeDiagrams: { value: string, title: string }[] = [
    { value: 'bar', title: 'Barre verticale' },
    { value: 'line', title: 'Courbe' },
  ];
  constructor(public dashboardSrv: DashboardService) { 
    super(dashboardSrv);
    this.methodName = 'countEmployeByStructure'; 
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
              labelString: 'Structures'
            }
          }
        },
        plugins: {
          title: {
            display: true,
            text: 'Nombres employé / Homme / Femme par Structure'
          }
        }
        
    };
    this.chartLabels = this.rawChartData.map(r => r.structure?.code);
    this.chartType = 'bar';
    this.chartLegend = true;
    this.chartPlugins = [];

    this.chartData = [
      { data: this.rawChartData.map(r => +r.nbreEmploye), label: 'Nombres employé' },
      { data: this.rawChartData.map(r => +r.nbrHomme), label: 'Homme' },
      { data: this.rawChartData.map(r => +r.nbrFemme), label: 'Femme' }
    ];
  }

}
