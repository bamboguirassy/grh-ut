import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { EchelonClasseService } from '../echelonclasse.service';
import { EchelonClasse } from '../echelonclasse';

@Component({
  selector: 'app-echelonclasse-list',
  templateUrl: './echelonclasse-list.component.html',
  styleUrls: ['./echelonclasse-list.component.scss']
})
export class EchelonClasseListComponent extends BasePageComponent<EchelonClasse> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public echelonClasseSrv: EchelonClasseService) {
    super(store, echelonClasseSrv);

    this.pageData = {
      title: 'Liste des EchelonClasses',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des echelonclasses'
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
