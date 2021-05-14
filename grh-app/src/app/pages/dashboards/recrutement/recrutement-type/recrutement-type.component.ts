import { Component, Input, OnInit } from '@angular/core';
import { ChartDataset } from 'chart.js';
import { EmployeService } from 'src/app/pages/gestionemploye/employe/employe.service';
import { DashboardBaseComponent } from 'src/app/shared/components/dashboard-base/dashboard-base.component';
import { RecrutementTypeCM } from '../recrutement-type-cm';

@Component({
  selector: 'app-recrutement-type',
  templateUrl: './recrutement-type.component.html',
  styleUrls: ['./recrutement-type.component.scss']
})
export class RecrutementTypeComponent extends DashboardBaseComponent<RecrutementTypeCM> implements OnInit {
  @Input() canSwitchDiagramType: boolean = true;
  typeDiagrams: { value: string, title: string }[] = [
    { value: 'bar', title: 'Barre verticale' },
    { value: 'line', title: 'Courbe' },
  ];

  constructor(
    public employeSrv: EmployeService
  ) {
    super(employeSrv);
    this.methodName = 'calculateStatsSuiviRecrutementGroupedByType';
  }

  ngOnInit(): void {
    this.buildDiagram();
  }

  setDataChart() {
    const chartData: ChartDataset[] = [];
    const typeEmployes = this.rawChartData[0].recrutements.map((r) => ({ code: r.typeEmployeCode, label: r.typeEmployeLabel }));
    for (const te of typeEmployes) {
      const arr: number[] = [];
      for (const chartData of this.rawChartData) {
        for (const recrutement of chartData.recrutements) {
          if (te.code === recrutement.typeEmployeCode) {
            arr.push(+recrutement.nombreRecrutement);
          }
        }
      }
      chartData.push({ data: arr, label: te.label });
    }    

    this.chartLabels = this.rawChartData.map((data) => data.annee);
    this.chartType = 'bar';
    this.chartLegend = true;
    this.chartPlugins = [];
    this.chartData = chartData;
  }

}
