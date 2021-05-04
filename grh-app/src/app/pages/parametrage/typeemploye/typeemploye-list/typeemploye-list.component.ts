import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { TypeEmployeService } from '../typeemploye.service';
import { TypeEmploye } from '../typeemploye';

@Component({
  selector: 'app-typeemploye-list',
  templateUrl: './typeemploye-list.component.html',
  styleUrls: ['./typeemploye-list.component.scss']
})
export class TypeEmployeListComponent extends BasePageComponent<TypeEmploye> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
    public typeEmployeSrv: TypeEmployeService) {
    super(store, typeEmployeSrv);

    this.pageData = {
      title: 'Liste des Types d\'employés',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des types d\'employés'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findAll();
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostDelete() {
    this.findAll();
  }

  handlePostLoad() { }

}
