import { Component, OnInit } from '@angular/core';
import { Employe } from '../employe';
import { EmployeService } from '../employe.service';

@Component({
  selector: 'app-employe-global',
  templateUrl: './employe-global.component.html',
  styleUrls: ['./employe-global.component.scss']
})
export class EmployeGlobalComponent implements OnInit {

  constructor(public employeSrv: EmployeService) { }
  items: Employe[] = [];
  
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
