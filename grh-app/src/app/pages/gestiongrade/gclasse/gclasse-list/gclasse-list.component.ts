import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { GClasseService } from '../gclasse.service';
import { GClasse } from '../gclasse';

@Component({
  selector: 'app-gclasse-list',
  templateUrl: './gclasse-list.component.html',
  styleUrls: ['./gclasse-list.component.scss']
})
export class GClasseListComponent extends BasePageComponent<GClasse> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public gClasseSrv: GClasseService) {
    super(store, gClasseSrv);

    this.pageData = {
      title: 'Liste des GClasses',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des gclasses'
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
