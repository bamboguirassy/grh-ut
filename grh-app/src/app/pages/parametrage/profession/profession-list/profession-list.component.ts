import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { ProfessionService } from '../profession.service';
import { Profession } from '../profession';

@Component({
  selector: 'app-profession-list',
  templateUrl: './profession-list.component.html',
  styleUrls: ['./profession-list.component.scss']
})
export class ProfessionListComponent extends BasePageComponent<Profession> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public professionSrv: ProfessionService) {
    super(store, professionSrv);

    this.pageData = {
      title: 'Liste des Professions',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des professions'
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
