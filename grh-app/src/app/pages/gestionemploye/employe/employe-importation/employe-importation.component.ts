import { Router } from '@angular/router';
import { Component, OnInit, VERSION, ViewChild } from '@angular/core';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { TypeEmploye } from 'src/app/pages/parametrage/typeemploye/typeemploye';
import { TypeEmployeService } from 'src/app/pages/parametrage/typeemploye/typeemploye.service';
import { Employe } from '../employe';
import { EmployeService } from '../employe.service';
import * as Papa from 'papaparse';


@Component({
  selector: 'app-employe-importation',
  templateUrl: './employe-importation.component.html',
  styleUrls: ['./employe-importation.component.scss']
})
export class EmployeImportationComponent extends BasePageComponent<Employe> implements OnInit {
  typeEmployes: TypeEmploye[] = [];
  selectedTypeEmploye: TypeEmploye;
  records: any[];
  isError = true;
  layout = 'horizontal';
  

  constructor(
    public employeSrv: EmployeService,
    store: Store<IAppState>,
    public typeEmployeSrv: TypeEmployeService,
    public router: Router
  ) {
    super(store, employeSrv);
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findTypeEmployes();
  }

  findTypeEmployes() {
    this.typeEmployeSrv.findAll()
      .subscribe((data: any) => {
        this.typeEmployes = data;
        this.setLoaded();
      }, err => this.typeEmployeSrv.httpSrv.catchError(err));
  }

  onChange(files: File[]) {
    if (files[0]) {
      Papa.parse(files[0], {
        header: true,
        skipEmptyLines: true,
        complete: (result, file) => {
          this.records = result.data;
        }
      });
    }
  }

  chargerEmployes(){
    //alert(this.selectedTypeEmploye);
    if(this.selectedTypeEmploye){
      this.employeSrv.chargerEmployeByTypeEmploye(this.selectedTypeEmploye, this.records)
        .subscribe((data: any) => {
          this.isError = false;
          //this.setLoaded();
        }, err => this.employeSrv.httpSrv.catchError(err));
    }
  }

  goTo(){
    this.router.navigate(['/' + this.layout + '/' + this.employeSrv.getRoutePrefix()]);
  }

}
