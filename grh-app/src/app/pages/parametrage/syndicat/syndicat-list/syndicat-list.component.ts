import { TypeEmployeService } from './../../typeemploye/typeemploye.service';
import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { SyndicatService } from '../syndicat.service';
import { Syndicat } from '../syndicat';
import { TypeEmploye } from '../../typeemploye/typeemploye';

@Component({
  selector: 'app-syndicat-list',
  templateUrl: './syndicat-list.component.html',
  styleUrls: ['./syndicat-list.component.scss']
})
export class SyndicatListComponent extends BasePageComponent<Syndicat> implements OnInit, OnDestroy {

  typeEmployes: TypeEmploye[] = [];
  selectedIndex = 0;
  constructor(store: Store<IAppState>,
              public syndicatSrv: SyndicatService,
              public typeEmployeSrv: TypeEmployeService) {
    super(store, syndicatSrv);

    this.pageData = {
      title: 'Liste des Partenaires Sociaux',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des Partenaires Sociaux'
        }
      ]
    };
  }

  findTypeEmployes() {
    this.typeEmployeSrv.findAll()
    .subscribe((data: any)=>{
      this.typeEmployes = data;
      this.findByTypeEmploye(this.typeEmployes[0]);
    },err=>this.typeEmployeSrv.httpSrv.catchError(err));
  }

  findByTypeEmploye(typeEmploye: TypeEmploye) {
    this.syndicatSrv.findByTypeEmploye(typeEmploye)
    .subscribe((data: any)=>{
      this.items = data;
    },err=>this.syndicatSrv.httpSrv.catchError(err));
  }

  handleTabChange(event) {
    this.findByTypeEmploye(this.typeEmployes[event.index]);
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.setLoaded();
   // this.findAll();
    this.findTypeEmployes();
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostDelete() {
    this.findByTypeEmploye(this.typeEmployes[this.selectedIndex]);
  }

  handlePostLoad(){}

}
