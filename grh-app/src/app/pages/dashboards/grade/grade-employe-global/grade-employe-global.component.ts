import { Component, Input, OnInit } from '@angular/core';
import { DashboardBaseComponent } from 'src/app/shared/components/dashboard-base/dashboard-base.component';
import { DashboardService } from '../../dashboard.service';
import { GradeEmployeCM } from '../grade-employe-cm';

@Component({
  selector: 'app-grade-employe-global',
  templateUrl: './grade-employe-global.component.html',
  styleUrls: ['./grade-employe-global.component.scss']
})
export class GradeEmployeGlobalComponent extends DashboardBaseComponent<GradeEmployeCM> implements OnInit {
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
    this.methodName = "countEmployeByGrade";
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
              labelString: 'Nombres'
            }
          },
          xAxes: {
            display: true,
            scaleLabel: {
              display: true,
              labelString: 'Grades'
            }
          }
        },
        plugins: {
          title: {
            display: true,
            text: 'Nombres d\'employé par grade'
          }
        }
        
    };
    this.chartLabels = this.rawChartData.map(r => r?.grade?.classification);
    this.chartType = 'bar';
    this.chartLegend = true;
    this.chartPlugins = [];

    this.chartData = [
      { data: this.rawChartData.map(r => +r.nombreEmploye), label: 'Effectif' },
    ];
  }

}
