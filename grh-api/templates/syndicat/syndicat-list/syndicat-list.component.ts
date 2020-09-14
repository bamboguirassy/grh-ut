import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { SyndicatService } from '../syndicat.service';
import { Syndicat } from '../syndicat';

@Component({
  selector: 'app-syndicat-list',
  templateUrl: './syndicat-list.component.html',
  styleUrls: ['./syndicat-list.component.scss']
})
export class SyndicatListComponent extends BasePageComponent<Syndicat> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public syndicatSrv: SyndicatService) {
    super(store, syndicatSrv);

    this.pageData = {
      title: 'Liste des Syndicats',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des syndicats'
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
