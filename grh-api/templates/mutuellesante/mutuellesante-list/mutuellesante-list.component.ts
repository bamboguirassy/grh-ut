import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { MutuelleSanteService } from '../mutuellesante.service';
import { MutuelleSante } from '../mutuellesante';

@Component({
  selector: 'app-mutuellesante-list',
  templateUrl: './mutuellesante-list.component.html',
  styleUrls: ['./mutuellesante-list.component.scss']
})
export class MutuelleSanteListComponent extends BasePageComponent<MutuelleSante> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public mutuelleSanteSrv: MutuelleSanteService) {
    super(store, mutuelleSanteSrv);

    this.pageData = {
      title: 'Liste des MutuelleSantes',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des mutuellesantes'
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
