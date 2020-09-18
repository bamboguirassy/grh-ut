import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { MembreFamilleService } from '../membrefamille.service';
import { MembreFamille } from '../membrefamille';

@Component({
  selector: 'app-membrefamille-list',
  templateUrl: './membrefamille-list.component.html',
  styleUrls: ['./membrefamille-list.component.scss']
})
export class MembreFamilleListComponent extends BasePageComponent<MembreFamille> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public membreFamilleSrv: MembreFamilleService) {
    super(store, membreFamilleSrv);

    this.pageData = {
      title: 'Liste des MembreFamilles',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des membrefamilles'
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
