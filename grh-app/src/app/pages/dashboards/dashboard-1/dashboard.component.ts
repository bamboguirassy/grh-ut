import { Component, OnDestroy, OnInit, Type } from '@angular/core';

import { Store } from '@ngrx/store';
import { EChartOption } from 'echarts';
import { BasePageComponent } from '../../base-page';
import { IAppState } from '../../../interfaces/app-state';
import { HttpService } from '../../../services/http/http.service';
import { EmployeService } from '../../gestionemploye/employe/employe.service';
import { TypeEmploye } from '../../parametrage/typeemploye/typeemploye';
import { TypeEmployeService } from '../../parametrage/typeemploye/typeemploye.service';
import { finalize } from 'rxjs/operators';
import { ChartDataSets, ChartOptions, ChartType } from 'chart.js';
import { Label } from 'ng2-charts';

@Component({
  selector: 'page-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class PageDashboardComponent extends BasePageComponent<any> implements OnInit, OnDestroy {
  hsOptions: EChartOption;
  paOptions: EChartOption;
  pgOptions: EChartOption;
  dOptions: EChartOption;
  piOptions: EChartOption;
  heOptions: EChartOption;
  appointments: any[];
  piePatternSrc: string;
  piePatternImg: any;
  pieStyle: any;
  typeEmployes: TypeEmploye[] = [];
  selectedTypeEmploye: TypeEmploye[] = [];
  fetching = false;
  statTypes: { code: string, title: string }[] = [
    { code: 'SR', title: 'Suivi des recrutement' }
  ];
  typeDiagrams: { value: string, title: string }[] = [
    { value: 'bar', title: 'Barre vertical' },
    { value: 'horizontalBar', title: 'Barre Horizontal' },
  ];
  selectedStatType: { code: string, title: string };

  // custom types
  tabCountEmploye = [];
  tabStatsByType: {
    nombreEmploye: number,
    nombreHomme: number,
    nombreFemme: number,
    tranche1830: number,
    tranche3040: number,
    tranche4050: number,
    tranche5060: number,
    tranchePlus60: number,
    caisseSociales: Array<any>,
    recrutement: Array<any>
  };

  suiviRecrutementTypeDataChart: any;
  suiviRecrutementGenreDataChart: any;
  loading = false;
  /* Chart suivi recrutement */
  public SRbarChartLabels: Label[] = [];
  public SRbarChartType: ChartType = 'bar';
  public SRbarChartLegend = true;
  public SRbarChartPlugins = [];

  public SRbarChartData: ChartDataSets[] = [];

  public SRbarChartOptions: ChartOptions = {
    responsive: true,
  };
  selectedSRTypeDiagram: string = 'bar';

  public SRGenrebarChartLabels: Label[] = [];
  public SRGenrebarChartType: ChartType = 'bar';
  public SRGenrebarChartLegend = true;
  public SRGenrebarChartPlugins = [];

  public SRGenrebarChartData: ChartDataSets[] = [];

  public SRGenrebarChartOptions: ChartOptions = {
    responsive: true,
  };
  selectedSRGenreTypeDiagram: string = 'bar';


  /* Fin Chart suivi recrutement */

  handlePostLoad() {
  }

  constructor(
    store: Store<IAppState>,
    httpSv: HttpService,
    public employeSrv: EmployeService,
    public typeEmployeSrv: TypeEmployeService,
  ) {
    super(store, httpSv);

    this.pageData = {
      title: 'Tableau de bord',
      loaded: false,
      breadcrumbs: [
        {
          title: 'Tableau de bord',
          route: 'default-dashboard'
        },
        {
          title: 'Global'
        }
      ]
    };
    this.appointments = [];
    this.piePatternSrc = 'assets/img/cbimage.png';
    this.piePatternImg = new Image();
    this.piePatternImg.src = this.piePatternSrc;
    this.pieStyle = {
      normal: {
        opacity: 0.7,
        color: {
          image: this.piePatternImg,
          repeat: 'repeat'
        },
        borderWidth: 3,
        borderColor: '#336cfb'
      }
    };
  }

  ngOnInit() {
    super.ngOnInit();

    this.getData('assets/data/last-appointments.json', 'appointments', 'setLoaded');

    // this.setHSOptions();
    //this.setPAOptions();
    //this.setPGOptions();
    //this.setDOptions();
    this.setPIOptions();
    this.setHEOptions();
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  setSuiviRecrutementTypeChart() {
    const chartData: ChartDataSets[] = [];
    const typeEmployes = this.suiviRecrutementTypeDataChart[0].recrutements.map((r) => ({ code: r.typeEmployeCode, label: r.typeEmployeLabel }));
    for (const te of typeEmployes) {
      const arr: number[] = [];
      for (const chartData of this.suiviRecrutementTypeDataChart) {
        for (const recrutement of chartData.recrutements) {
          if (te.code === recrutement.typeEmployeCode) {
            arr.push(recrutement.nombreRecrutement);
          }
        }
      }
      chartData.push({ data: arr, label: te.label });
    }

    this.SRbarChartLabels = this.suiviRecrutementTypeDataChart.map((data: { annee: number, recrutement: { typeEmployeLabel: string, nombreRecrutement: number, typeEmployeCode: number } }) => data.annee);
    this.SRbarChartType = 'bar';
    this.SRbarChartLegend = true;
    this.SRbarChartPlugins = [];
    this.SRbarChartData = chartData;
  }

  switchDiagram(event: any) {

    switch (event.code) {
      case 'SR':
        this.buildSuiviRecrutementDiagrams();
        break;
    }

  }

  buildSuiviRecrutementDiagrams() {
    this.loading = true;
    this
      .employeSrv
      .calculateStatsSuiviRecrutementGroupedByType()
      .pipe(finalize(() => this.loading = false))
      .subscribe((data: any) => {
        this.suiviRecrutementTypeDataChart = data;
        this.setSuiviRecrutementTypeChart();
      }, err => {
        this.employeSrv.httpSrv.handleError(err);
      });

    this
      .employeSrv
      .calculateRecrutementGroupedByGenres()
      .pipe(finalize(() => this.loading = false))
      .subscribe((data: any) => {
        this.suiviRecrutementGenreDataChart = data;
        this.setSuiviRecrutementGenreChart();
      }, err => {
        this.employeSrv.httpSrv.handleError(err);
      });
  }

  setSuiviRecrutementGenreChart() {
    this.SRGenrebarChartOptions = {
      responsive: true,
    };
    this.SRGenrebarChartLabels = this.suiviRecrutementGenreDataChart.map(r => r.annee);
    this.SRGenrebarChartType = 'bar';
    this.SRGenrebarChartLegend = true;
    this.SRGenrebarChartPlugins = [];
  
    this.SRGenrebarChartData = [
      { data: this.suiviRecrutementGenreDataChart.map(r => r.nombreRecrutementFemme), label: 'Femme' },
      { data: this.suiviRecrutementGenreDataChart.map(r => r.nombreRecrutementHomme), label: 'Homme' }
    ];
  }


  fetchTypeEmployes() {
    if (!this.typeEmployes.length) {
      this.fetching = true;
      this
        .typeEmployeSrv
        .findAll()
        .pipe(
          finalize(() => this.fetching = false)
        ).subscribe((typeEmployes: any) => {
          this.typeEmployes = typeEmployes;
        }, error => {
          this.typeEmployeSrv.httpSrv.catchError(error);
        });
    }
  }

  findStatsByType(event: any) {

    this
      .employeSrv
      .findStatsByType(event)
      .subscribe((tab: any) => {
        this.tabStatsByType = tab[0];
        this.setPGOptions();
        this.setPAOptions();
        this.setDOptions();
        // this.setHSOptions();
        this.setSuiviRecrutementTypeChart();
      }, err => {
        this.employeSrv.httpSrv.handleError(err);
      });

  }

  getEmployeCountStatistics() {
    this.employeSrv.countByType()
      .subscribe((data: any) => {
        this.tabCountEmploye = data;
      }, error => {
        this.employeSrv.httpSrv.catchError(error);
      });
  }

  /*setHSOptions() {
    const courant: Array<any> = [];
    const precedent: Array<any> = [];
    const abCourant: string[] = [];
    const abPrecendent: string[] = [];
    const currentYear = new Date().getFullYear();
    const previousYear = new Date().getFullYear() - 1;
    this
      .tabStatsByType
      .recrutementCourant
      .forEach(rc => {
        courant.push(rc.nombre);
        abCourant.push(`${currentYear}-${rc.mois}`);
      });

    this
      .tabStatsByType
      .recrutementPrecedent
      .forEach(rc => {
        precedent.push(rc.nombre);
        abPrecendent.push(`${previousYear}-${rc.mois}`);
      });

    this.hsOptions = {
      color: ['#ed5564', '#336cfb'],
      tooltip: {
        trigger: 'none',
        axisPointer: {
          type: 'cross'
        }
      },
      legend: {
        data: [`Recrutement ${previousYear}`, `Recrutement  ${currentYear}`]
      },
      grid: {
        left: 30,
        right: 0,
        top: 50,
        bottom: 50
      },
      xAxis: [
        {
          type: 'category',
          axisTick: {
            alignWithLabel: true
          },
          axisLine: {
            onZero: false,
            lineStyle: {
              color: '#336cfb'
            }
          },
          axisPointer: {
            label: {
              formatter: function (params) {
                return 'Recrutements ' + params.value
                  + (params.seriesData.length ? '：' + params.seriesData[0].data : '');
              }
            }
          },
          data: abCourant
        },
        {
          type: 'category',
          axisTick: {
            alignWithLabel: true
          },
          axisLine: {
            onZero: false,
            lineStyle: {
              color: '#ed5564'
            }
          },
          axisPointer: {
            label: {
              formatter: function (params) {
                return 'Recrutements ' + params.value
                  + (params.seriesData.length ? '：' + params.seriesData[0].data : '');
              }
            }
          },
          data: abPrecendent
        }
      ],
      yAxis: [
        {
          type: 'value'
        }
      ],
      series: [
        {
          name: `Recrutement ${previousYear}`,
          type: 'line',
          xAxisIndex: 1,
          smooth: true,
          data: precedent
        },
        {
          name: `Recrutement  ${currentYear}`,
          type: 'line',
          smooth: true,
          data: courant
        }
      ]
    };
  }*/

  setPAOptions() {
    const data: Array<{ value: number, name: string }> = [];
    if (this.tabStatsByType.tranche1830 > 0) {
      data.push({ value: this.tabStatsByType.tranche1830, name: '18-30' });
    }
    if (this.tabStatsByType.tranche3040 > 0) {
      data.push({ value: this.tabStatsByType.tranche3040, name: '30-40' });
    }
    if (this.tabStatsByType.tranche4050 > 0) {
      data.push({ value: this.tabStatsByType.tranche4050, name: '40-50' });
    }
    if (this.tabStatsByType.tranche5060 > 0) {
      data.push({ value: this.tabStatsByType.tranche5060, name: '50-60' });
    }
    if (this.tabStatsByType.tranchePlus60 > 0) {
      data.push({ value: this.tabStatsByType.tranchePlus60, name: '60+' });
    }
    this.paOptions = {
      grid: {
        left: 0,
        right: 0,
        top: 0,
        bottom: 0
      },
      tooltip: {
        trigger: 'item',
        formatter: '{b}<br>{c} ({d}%)'
      },
      series: [{
        name: 'pie',
        type: 'pie',
        selectedMode: 'single',
        selectedOffset: 30,
        clockwise: true,
        radius: [60, '90%'],
        label: {
          normal: {
            position: 'inner',
            textStyle: {
              fontSize: 14,
              fontWeight: 700,
              color: '#000'
            }
          }
        },
        labelLine: {
          normal: {
            lineStyle: {
              color: '#336cfb'
            }
          }
        },
        data: data,
        itemStyle: this.pieStyle
      }]
    };
  }

  setPGOptions() {
    this.pgOptions = {
      grid: {
        left: 0,
        right: 0,
        top: 0,
        bottom: 0
      },
      tooltip: {
        trigger: 'item',
        formatter: '{b}<br>{c} ({d}%)'
      },
      series: [{
        name: 'pie',
        type: 'pie',
        selectedMode: 'single',
        selectedOffset: 30,
        clockwise: true,
        radius: [0, '90%'],
        label: {
          normal: {
            position: 'inner',
            textStyle: {
              fontSize: 14,
              fontWeight: 700,
              color: '#000'
            }
          }
        },
        labelLine: {
          normal: {
            lineStyle: {
              color: '#336cfb'
            }
          }
        },
        data: [
          { value: this.tabStatsByType.nombreFemme, name: 'Femme' },
          { value: this.tabStatsByType.nombreHomme, name: 'Homme' }
        ],
        itemStyle: this.pieStyle
      }]
    };
  }

  setDOptions() {
    const data: Array<any> = [];
    this.tabStatsByType.caisseSociales.forEach(cs => {
      data.push({ value: cs.nombre, name: cs.nom });
    });
    this.dOptions = {
      grid: {
        left: 0,
        right: 0,
        top: 0,
        bottom: 0
      },
      tooltip: {
        trigger: 'item',
        formatter: '{b}<br>{c} ({d}%)'
      },
      series: [{
        name: 'pie',
        type: 'pie',
        radius: [0, '90%'],
        roseType: 'area',
        label: {
          normal: {
            show: false
          }
        },
        data: data,
        itemStyle: this.pieStyle
      }]
    };
  }

  setPIOptions() {
    this.piOptions = {
      color: ['#ed5564'],
      grid: {
        left: 0,
        right: 0,
        top: 0,
        bottom: 0
      },
      xAxis: {
        boundaryGap: false,
        type: 'category'
      },
      yAxis: {
        show: false
      },
      series: [
        {
          name: 'Patients 2019',
          type: 'line',
          smooth: true,
          data: [95, 124, 132, 143, 138, 178, 194, 211, 234, 257, 241, 226],
          areaStyle: {}
        }
      ]
    };
  }

  setHEOptions() {
    this.heOptions = {
      color: ['#64B5F6'],
      grid: {
        left: 0,
        right: 0,
        top: 0,
        bottom: 0
      },
      xAxis: {
        boundaryGap: false,
        type: 'category'
      },
      yAxis: {
        show: false
      },
      series: [
        {
          name: 'Patients 2019',
          type: 'line',
          smooth: true,
          data: [94, 111, 90, 85, 70, 83, 94, 109, 89, 74, 83, 78],
          areaStyle: {}
        }
      ]
    };
  }
}
