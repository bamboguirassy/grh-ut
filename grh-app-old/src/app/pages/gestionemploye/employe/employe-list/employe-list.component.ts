import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { EmployeService } from '../employe.service';
import { Employe } from '../employe';
import { TypeEmploye } from 'src/app/pages/parametrage/typeemploye/typeemploye';
import { TypeEmployeService } from 'src/app/pages/parametrage/typeemploye/typeemploye.service';

@Component({
  selector: 'app-employe-list',
  templateUrl: './employe-list.component.html',
  styleUrls: ['./employe-list.component.scss']
})
export class EmployeListComponent extends BasePageComponent<Employe> implements OnInit, OnDestroy {

  typeEmployes: TypeEmploye[] = [];
  selectedIndex = 0;

  constructor(store: Store<IAppState>,
    public employeSrv: EmployeService,
    public typeEmployeSrv: TypeEmployeService) {
    super(store, employeSrv);

    this.pageData = {
      title: 'Liste des Employes',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des employes'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findTypeEmployes();
    
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostDelete() {
    this.findByTypeEmploye(this.typeEmployes[this.selectedIndex]);
  }

  handlePostLoad() { }

  findTypeEmployes() {
    this.typeEmployeSrv.findAll()
      .subscribe((data: any) => {
        this.typeEmployes = data;
        this.setLoaded();
        this.findByTypeEmploye(this.typeEmployes[0]);
      }, err => this.typeEmployeSrv.httpSrv.catchError(err));
  }

  findByTypeEmploye(typeEmploye: TypeEmploye) {
    this.employeSrv.findByTypeEmploye(typeEmploye)
      .subscribe((data: any) => {
        this.items = data;
      }, err => this.employeSrv.httpSrv.catchError(err));
  }

  handleTabChange(event) {
    this.findByTypeEmploye(this.typeEmployes[event.index]);
  }
  

}
