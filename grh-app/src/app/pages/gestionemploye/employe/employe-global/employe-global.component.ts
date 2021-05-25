import { Component, OnInit } from '@angular/core';
import { ISuperTableColumn } from 'ngx-super-table';
import { Employe } from '../employe';
import { employeColumns } from '../employe.columns';
import { EmployeService } from '../employe.service';

@Component({
  selector: 'app-employe-global',
  templateUrl: './employe-global.component.html',
  styleUrls: ['./employe-global.component.scss']
})
export class EmployeGlobalComponent implements OnInit {

  constructor(public employeSrv: EmployeService) { }
  items: Employe[] = [];
  rows = this.items;
  columns: ISuperTableColumn[] = employeColumns;
  options = {}
  ngOnInit(): void {
    this.getEmployes();
  }

  getEmployes() {
    this.employeSrv.employesProvider
      .subscribe((data: any) => {
        this.items = data;
        
      }, err => this.employeSrv.httpSrv.catchError(err));
  }

}
