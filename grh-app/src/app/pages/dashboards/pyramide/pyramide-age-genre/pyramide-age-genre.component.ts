import { Component, Input, OnInit } from '@angular/core';
import { finalize } from 'rxjs/operators';
import { TypeEmploye } from 'src/app/pages/parametrage/typeemploye/typeemploye';
import { TypeEmployeService } from 'src/app/pages/parametrage/typeemploye/typeemploye.service';
import { DashboardBaseComponent } from 'src/app/shared/components/dashboard-base/dashboard-base.component';
import { DashboardService } from '../../dashboard.service';
import { PyramideAgeGenreCm } from '../pyramide-age-genre-cm';

@Component({
  selector: 'app-pyramide-age-genre',
  templateUrl: './pyramide-age-genre.component.html',
  styleUrls: ['./pyramide-age-genre.component.scss']
})
export class PyramideAgeGenreComponent extends DashboardBaseComponent<PyramideAgeGenreCm> implements OnInit {
  @Input() canSwitchDiagramType: boolean = true;
  typeDiagrams: { value: string, title: string }[] = [
    { value: 'bar', title: 'Barre verticale' },
    { value: 'line', title: 'Courbe' },
  ];

  selectedTypeEmploye: TypeEmploye;
  items: any;
  isLoad: boolean;
  dataDiagram: any;
  constructor(public dashboardSrv: DashboardService, public typeEmployeSrv: TypeEmployeService) {
    super(dashboardSrv);
  }

  ngOnInit(): void {
    this.getTypeEmployes();
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
              labelString: 'Plages'
            }
          }
        },
        plugins: {
          title: {
            display: true,
            text: 'Nombres employé par tranche d\'age'
          }
        }
        
    };
    this.chartLabels = this.rawChartData.map(r => r.dateNaissance);
    this.chartType = 'bar';
    this.chartLegend = true;
    this.chartPlugins = [];

    this.chartData = [
      { data: this.rawChartData.map(r => +r.nombreEmployeHomme), label: 'Homme' },
      { data: this.rawChartData.map(r => +r.nombreEmployeFemme), label: 'Femme' }
    ];
  }

  buildDiagram() {
    this.loading = true;
    if(this.selectedTypeEmploye){
      this.dashboardSrv.countAgeByTypeEmploye(this.selectedTypeEmploye)
        .pipe(finalize(() => this.loading = false))
        .subscribe((data: any) => {
          this.isLoad = true;
          this.dataDiagram = data;
          this.handlePostFetch(this.dataDiagram as []);
        }, err => {
          this.httpSrv.httpSrv.catchError(err);
        });
    }
  }

  getTypeEmployes(){
    this.typeEmployeSrv.findAll().subscribe(
      (data:any)=>{
        this.items = data;
      },(err)=>{ this.httpSrv.httpSrv.catchError(err);});
  }

}
