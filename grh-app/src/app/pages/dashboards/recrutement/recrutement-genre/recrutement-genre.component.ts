import { Component, Input, OnInit } from '@angular/core';
import { finalize } from 'rxjs/operators';
import { EmployeService } from 'src/app/pages/gestionemploye/employe/employe.service';
import { DashboardBaseComponent } from 'src/app/shared/components/dashboard-base/dashboard-base.component';
import { RecrutementGenreCM } from '../recrutement-genre-cm';

@Component({
  selector: 'app-recrutement-genre',
  templateUrl: './recrutement-genre.component.html',
  styleUrls: ['./recrutement-genre.component.scss']
})
export class RecrutementGenreComponent extends DashboardBaseComponent<RecrutementGenreCM> implements OnInit {
  @Input() canSwitchDiagramType: boolean = true;
  typeDiagrams: { value: string, title: string }[] = [
    { value: 'bar', title: 'Barre verticale' },
    // { value: 'pie', title: 'Pie' },
    { value: 'line', title: 'Courbe' },
  ];
  constructor(
    public employeSrv: EmployeService,
  ) {
    super(employeSrv);
    this.methodName = 'calculateRecrutementGroupedByGenres';
  }

  ngOnInit(): void {
    this.buildDiagram();
  }

  setDataChart() {
    this.chartOptions = {
      responsive: true,
    };
    this.chartLabels = this.rawChartData.map(r => r.annee);
    this.chartType = 'bar';
    this.chartLegend = true;
    this.chartPlugins = [];

    this.chartData = [
      { data: this.rawChartData.map(r => +r.nombreRecrutementFemme), label: 'Femme' },
      { data: this.rawChartData.map(r => +r.nombreRecrutementHomme), label: 'Homme' }
    ];
  }

}
