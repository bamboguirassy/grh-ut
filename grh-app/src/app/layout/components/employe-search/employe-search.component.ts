import { Router } from '@angular/router';
import { EmployeService } from 'src/app/pages/gestionemploye/employe/employe.service';
import { Component, OnInit } from '@angular/core';
import { Employe } from 'src/app/pages/gestionemploye/employe/employe';

@Component({
  selector: 'employe-search',
  templateUrl: './employe-search.component.html',
  styleUrls: ['./employe-search.component.scss']
})
export class EmployeSearchComponent implements OnInit {
  keyword = 'globalFilter';
  items: Employe [] = [];
  constructor(public employeSrv: EmployeService, public router: Router) {
     }

  ngOnInit(): void {
    this.findTypeEmployes();
  }

  selectEvent(item) {
    // do something with selected item
    this.router.navigate(['/horizontal/employe/'+item.id]); 
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
        this.items.forEach(element => {
          element.globalFilter = `${element.prenoms}`+' '+`${element.nom}`+' '+`${element.matricule}`+' '+`${element.cni}`+' '+`${element.email}`;
        });       
      }, err => this.employeSrv.httpSrv.catchError(err));
  }

}
