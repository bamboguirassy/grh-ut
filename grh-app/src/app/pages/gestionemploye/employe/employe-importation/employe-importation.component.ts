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
import { StructureService } from 'src/app/pages/parametrage/structure/structure.service';
import { Structure } from 'src/app/pages/parametrage/structure/structure';


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
  structures: Structure[] = [];
  selectedStructureId: number;

  constructor(
    public employeSrv: EmployeService,
    store: Store<IAppState>, public structureSrv: StructureService,
    public typeEmployeSrv: TypeEmployeService,
    public router: Router
  ) {
    super(store, employeSrv);
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findTypeEmployes();
    this.findStructures();
  }

  findTypeEmployes() {
    this.typeEmployeSrv.findAll()
      .subscribe((data: any) => {
        this.typeEmployes = data;
        this.setLoaded();
      }, err => this.typeEmployeSrv.httpSrv.catchError(err));
  }

  findStructures() {
    this
      .structureSrv
      .findAll()
      .subscribe((structures: any) => {
        this.structures = structures;
      }, err => {
        this.structureSrv.httpSrv.catchError(err);
      });
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

  chargerEmployes() {
    if (this.selectedTypeEmploye && this.selectedStructureId) {
      this.records.forEach(r => r.structure = this.selectedStructureId);
      this.employeSrv.chargerEmployeByTypeEmploye(this.selectedTypeEmploye, this.records)
        .subscribe((data: any) => {
          this.isError = false;
        }, err => this.employeSrv.httpSrv.catchError(err));
    }
  }

  goTo() {
    this.router.navigate(['/' + this.layout + '/' + this.employeSrv.getRoutePrefix()]);
  }

}
