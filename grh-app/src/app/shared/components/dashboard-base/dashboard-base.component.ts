import { Component, OnInit } from '@angular/core';
import { ChartDataset, ChartOptions, ChartType, Color } from 'chart.js';
import { Label } from 'ng2-charts';
import { finalize } from 'rxjs/operators';
import { DashboardService } from 'src/app/pages/dashboards/dashboard.service';
import { SETTINGS } from 'src/environments/settings';
import { BamboAbstractChartModel } from '../../classes/bambo-abstract-chart-model';
import { BamboAbstractService } from '../../services/bambo-abstract.service';
import * as XLSX from 'xlsx';

@Component({
  selector: 'app-dashboard-base',
  templateUrl: './dashboard-base.component.html',
  styleUrls: ['./dashboard-base.component.scss']
})
export class DashboardBaseComponent<T extends BamboAbstractChartModel> implements OnInit {
  rawChartData: T[]|any;
  chartLabels: Label[] = [];
  chartType: ChartType = 'bar';
  chartLegend = true;
  chartPlugins = [];
  typeDiagrams: Array<{ value: string, title: string }>;
  chartData: ChartDataset[] = [];
  methodName: string;
  loading = false;
  chartOptions: ChartOptions = {
    responsive: true,
  };
  selectedTypeDiagram: ChartType = 'bar';
  tableData: any;
  // colors: Color[] = [SETTINGS.sidebarBg, 'red', 'green','orange'];

  constructor(
    public httpSrv: DashboardService,
  ) {

  }

  ngOnInit(): void {
  }

  setDataChart() {
    throw new Error('Method not implemented');
  }

  buildDiagram() {
    this.loading = true;
    this
      .httpSrv
       [`${this.methodName}`]()
      .pipe(finalize(() => this.loading = false))
      .subscribe((data: any) => {
        this.handlePostFetch(data as T[]);
      }, err => {
        this.httpSrv.httpSrv.catchError(err);
      });
  }

  handlePostFetch(data: T[]) {
    this.rawChartData = data;
    this.setDataChart();
  }

  exportToExcel(tableId: string, fileName: string) {
    /* table id is passed over here */
    const element = document.getElementById(tableId);
    const ws: XLSX.WorkSheet = XLSX.utils.table_to_sheet(element);
    /* generate workbook and add the worksheet */
    const wb: XLSX.WorkBook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');
    /* save to file */
    XLSX.writeFile(wb, fileName + tableId + (new Date().toDateString()) + '.xlsx');
  }

}
