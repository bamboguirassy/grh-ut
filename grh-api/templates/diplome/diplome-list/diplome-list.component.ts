import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { DiplomeService } from '../diplome.service';
import { Diplome } from '../diplome';

@Component({
  selector: 'app-diplome-list',
  templateUrl: './diplome-list.component.html',
  styleUrls: ['./diplome-list.component.scss']
})
export class DiplomeListComponent extends BasePageComponent<Diplome> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public diplomeSrv: DiplomeService) {
    super(store, diplomeSrv);

    this.pageData = {
      title: 'Liste des Diplomes',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des diplomes'
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
