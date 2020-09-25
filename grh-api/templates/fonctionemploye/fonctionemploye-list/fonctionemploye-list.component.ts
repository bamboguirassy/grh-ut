import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { FonctionEmployeService } from '../fonctionemploye.service';
import { FonctionEmploye } from '../fonctionemploye';

@Component({
  selector: 'app-fonctionemploye-list',
  templateUrl: './fonctionemploye-list.component.html',
  styleUrls: ['./fonctionemploye-list.component.scss']
})
export class FonctionEmployeListComponent extends BasePageComponent<FonctionEmploye> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public fonctionEmployeSrv: FonctionEmployeService) {
    super(store, fonctionEmployeSrv);

    this.pageData = {
      title: 'Liste des FonctionEmployes',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des fonctionemployes'
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

  handlePostLoad(){}

}
