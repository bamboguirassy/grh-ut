import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { GClasseService } from '../gclasse.service';
import { GClasse } from '../gclasse';
import { TypeEmployeService } from 'src/app/pages/parametrage/typeemploye/typeemploye.service';
import { TypeEmploye } from 'src/app/pages/parametrage/typeemploye/typeemploye';
import { Type } from '@angular/compiler/src/core';

@Component({
  selector: 'app-gclasse-list',
  templateUrl: './gclasse-list.component.html',
  styleUrls: ['./gclasse-list.component.scss']
})
export class GClasseListComponent extends BasePageComponent<GClasse> implements OnInit, OnDestroy {

  typeEmployes: TypeEmploye[] = [];
  selectedIndex = 0;

  constructor(store: Store<IAppState>,
    public gClasseSrv: GClasseService,
    public typeEmployeSrv: TypeEmployeService) {
    super(store, gClasseSrv);

    this.pageData = {
      title: 'Liste des classes',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des classes'
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
      }, err => this.typeEmployeSrv.httpSrv.catchError(err));
  }
  findByTypeEmploye(typeEmploye: TypeEmploye) {
    this.items = [];
    this.gClasseSrv.findByTypeEmploye(typeEmploye)
      .subscribe((data: any) => {
        this.items = data;
      }, err => this.gClasseSrv.httpSrv.catchError(err));
  }
  handleTabChange(event) {
    this.findByTypeEmploye(this.typeEmployes[event.index]);
  }

}
