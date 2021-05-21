import { EmployeService } from 'src/app/pages/gestionemploye/employe/employe.service';
import { Store } from '@ngrx/store';
import { IAppState } from './../../../../interfaces/app-state';
import { Employe } from './../employe';
import { BasePageComponent } from './../../../base-page/base-page.component';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-employe-search',
  templateUrl: './employe-search.component.html',
  styleUrls: ['./employe-search.component.scss']
})
export class EmployeSearchComponent implements OnInit {
  keyword = 'prenoms';
  items: Employe [] = [];
  constructor(public employeSrv: EmployeService) {
     }

  ngOnInit(): void {
    this.findTypeEmployes();
  }

  selectEvent(item) {
    // do something with selected item
  }
 
  onChangeSearch(val: string) {
    // fetch remote data from here
    // And reassign the 'data' which is binded to 'data' property.
  }
  
  onFocused(e){
    // do something when input is focused
  }

  findTypeEmployes() {
    this.employeSrv.employesProvider
      .subscribe((data: any) => {
        this.items = data;        
      }, err => this.employeSrv.httpSrv.catchError(err));
  }

}
