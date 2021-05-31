import { Router } from '@angular/router';
import { EmployeService } from 'src/app/pages/gestionemploye/employe/employe.service';
import { Component, Input, OnInit } from '@angular/core';
import { Employe } from 'src/app/pages/gestionemploye/employe/employe';

@Component({
  selector: 'employe-search',
  templateUrl: './employe-search.component.html',
  styleUrls: ['./employe-search.component.scss']
})
export class EmployeSearchComponent implements OnInit {
  keyword = 'globalFilter';
  items: Employe[] = [];
  filteredOptions: Employe[] = [];
  @Input() layout = 'horizontal';
  inputValue: string;
  searchTerm: any;
  datas: any;

  constructor(public employeSrv: EmployeService, public router: Router) {
  }

  ngOnInit(): void {
    //this.getEmployes();
  }

  selectEvent(item) {
    // do something with selected item
    this.router.navigate(['/'+this.layout+'/' + this.employeSrv.getRoutePrefix() + item.id]);
    item = null;
  }

  // onChange(value: string): void {
  //   if(value.length>3) {
  //     this.filteredOptions = this.items.filter(item => item.globalFilter.toLowerCase().indexOf(value.toLowerCase()) !== -1);
  //   } else {
  //     this.filteredOptions = [];
  //   }
  // }

  // getEmployes() {
  //   this.employeSrv.employesProvider
  //     .subscribe((data: any) => {
  //       this.items = data;
  //       this.items.forEach(element => {
  //         element.globalFilter = `${element.prenoms}` + ' ' + `${element.nom}` + ' ' + `${element.matricule}` + ' ' + `${element.cni}` + ' ' + `${element.email}`;
  //       });
  //     }, err => this.employeSrv.httpSrv.catchError(err));
  // }

  getEmployes(){
    if(this.searchTerm.length>0 && this.searchTerm.length > 3){
      this.employeSrv.realtimeSearch(this.searchTerm)
        .subscribe((data: any) => {
          this.filteredOptions = data;          
        }, err => this.employeSrv.httpSrv.catchError(err));
    }
  }

}
