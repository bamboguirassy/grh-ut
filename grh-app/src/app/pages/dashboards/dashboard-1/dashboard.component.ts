import { Component, OnDestroy, OnInit } from '@angular/core';

import { Store } from '@ngrx/store';
import { EChartOption } from 'echarts';
import { BasePageComponent } from '../../base-page';
import { IAppState } from '../../../interfaces/app-state';
import { HttpService } from '../../../services/http/http.service';
import { EmployeService } from '../../gestionemploye/employe/employe.service';

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

  // custom types
  tabCountEmploye = [];

  handlePostLoad() { }

  constructor(
    store: Store<IAppState>,
    httpSv: HttpService,
    public employeSrv: EmployeService
  ) {
    super(store, httpSv);

    this.pageData = {
      title: 'Tableau de bord',
      loaded: false,
      breadcrumbs: [
        {
          title: 'Dashboards',
          route: 'default-dashboard'
        },
        {
          title: 'Default'
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

    this.setHSOptions();
    this.setPAOptions();
    this.setPGOptions();
    this.setDOptions();
    this.setPIOptions();
    this.setHEOptions();
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  getEmployeCountStatistics() {
    this.employeSrv.countByType()
      .subscribe((data: any) => {
        this.tabCountEmploye = data;
      }, error => {
        this.employeSrv.httpSrv.catchError(error);
      });
  }

  setHSOptions() {
    this.hsOptions = {
      color: ['#ed5564', '#336cfb'],
      tooltip: {
        trigger: 'none',
        axisPointer: {
          type: 'cross'
        }
      },
      legend: {
        data: ['Patients 2018', 'Patients 2019']
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
                return 'Patients ' + params.value
                  + (params.seriesData.length ? '：' + params.seriesData[0].data : '');
              }
            }
          },
          data: ['2019-1', '2019-2', '2019-3', '2019-4', '2019-5', '2019-6', '2019-7', '2019-8', '2019-9', '2019-10', '2019-11', '2019-12']
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
                return 'Patients ' + params.value
                  + (params.seriesData.length ? '：' + params.seriesData[0].data : '');
              }
            }
          },
          data: ['2018-1', '2018-2', '2018-3', '2018-4', '2018-5', '2018-6', '2018-7', '2018-8', '2018-9', '2018-10', '2018-11', '2018-12']
        }
      ],
      yAxis: [
        {
          type: 'value'
        }
      ],
      series: [
        {
          name: 'Patients 2018',
          type: 'line',
          xAxisIndex: 1,
          smooth: true,
          data: [159, 149, 174, 182, 219, 201, 175, 182, 119, 118, 112, 96]
        },
        {
          name: 'Patients 2019',
          type: 'line',
          smooth: true,
          data: [95, 124, 132, 143, 138, 178, 194, 211, 234, 257, 241, 226]
        }
      ]
    };
  }

  setPAOptions() {
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
        data: [
          { value: 347, name: '0-10' },
          { value: 310, name: '10-20' },
          { value: 234, name: '20-30' },
          { value: 195, name: '30-40' },
          { value: 670, name: '40+' }
        ],
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
          { value: 154, name: 'Female' },
          { value: 173, name: 'Male' }
        ],
        itemStyle: this.pieStyle
      }]
    };
  }

  setDOptions() {
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
        data: [
          { value: 115, name: 'Cardiology' },
          { value: 173, name: 'Dentistry' },
          { value: 154, name: 'Laboratory' },
          { value: 180, name: 'Pulmonology' },
          { value: 219, name: 'Gynecology' }
        ],
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
