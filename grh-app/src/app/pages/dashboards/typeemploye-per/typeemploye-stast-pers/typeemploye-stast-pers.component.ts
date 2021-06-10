import { Component, Input, OnInit } from '@angular/core';
import { DashboardBaseComponent } from 'src/app/shared/components/dashboard-base/dashboard-base.component';
import { DashboardService } from '../../dashboard.service';
import { TypeEmployeStatsPer } from '../typeemploye-stats-per';

@Component({
  selector: 'app-typeemploye-stast-pers',
  templateUrl: './typeemploye-stast-pers.component.html',
  styleUrls: ['./typeemploye-stast-pers.component.scss']
})
export class TypeemployeStastPersComponent extends DashboardBaseComponent<TypeEmployeStatsPer> implements OnInit {
  @Input() canSwitchDiagramType: boolean = true;
  typeDiagrams: { value: string, title: string }[] = [
    { value: 'bar', title: 'Barre verticale' },
    { value: 'line', title: 'Courbe' },
  ];
  constructor(public dashboardSrv: DashboardService) { 
    super(dashboardSrv);
    this.methodName = 'countPersByGradeGroupByGenre'; 
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
              labelString: "Nombre d'employés Pers"
            }
          },
          xAxes: {
            display: true,
            scaleLabel: {
              display: true,
              labelString: 'Type Employe PER'
            }
          }
        },
        plugins: {
          title: {
            display: true,
            text: 'Nombres employé / Homme / Femme par Type Employe PER'
          }
        }
        
    };
    this.chartLabels = this.rawChartData.map(r => r.grade);
    this.chartType = 'bar';
    this.chartLegend = true;
    this.chartPlugins = [];

    this.chartData = [
      { data: this.rawChartData.map(r => +r.nbrHomme), label: 'Homme' },
      { data: this.rawChartData.map(r => +r.nbrFemme), label: 'Femme' }
    ];
  }


}
