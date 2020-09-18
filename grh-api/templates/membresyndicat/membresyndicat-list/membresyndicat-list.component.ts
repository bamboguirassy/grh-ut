import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { MembreSyndicatService } from '../membresyndicat.service';
import { MembreSyndicat } from '../membresyndicat';

@Component({
  selector: 'app-membresyndicat-list',
  templateUrl: './membresyndicat-list.component.html',
  styleUrls: ['./membresyndicat-list.component.scss']
})
export class MembreSyndicatListComponent extends BasePageComponent<MembreSyndicat> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public membreSyndicatSrv: MembreSyndicatService) {
    super(store, membreSyndicatSrv);

    this.pageData = {
      title: 'Liste des MembreSyndicats',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des membresyndicats'
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
