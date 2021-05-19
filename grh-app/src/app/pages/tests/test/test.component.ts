import { DashboardService } from 'src/app/pages/dashboards/dashboard.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-test',
  templateUrl: './test.component.html',
  styleUrls: ['./test.component.scss']
})
export class TestComponent implements OnInit {
  // custom professions
  tabCountEmploye = [];

  constructor(public dashboardServ: DashboardService) { }

  ngOnInit(): void {
    this.getEmployeCountStatistics();
  }

  getEmployeCountStatistics(){
    this.dashboardServ.countByProfession()
      .subscribe((data: any) => {
        this.tabCountEmploye = data;
        console.log(this.tabCountEmploye);
        
      }, error => {
        this.dashboardServ.httpSrv.catchError(error);
      });
  }

}
