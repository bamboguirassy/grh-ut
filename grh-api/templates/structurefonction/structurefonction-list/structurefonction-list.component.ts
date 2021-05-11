import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { StructureFonctionService } from '../structurefonction.service';
import { StructureFonction } from '../structurefonction';

@Component({
  selector: 'app-structurefonction-list',
  templateUrl: './structurefonction-list.component.html',
  styleUrls: ['./structurefonction-list.component.scss']
})
export class StructureFonctionListComponent extends BasePageComponent<StructureFonction> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public structureFonctionSrv: StructureFonctionService) {
    super(store, structureFonctionSrv);

    this.pageData = {
      title: 'Liste des StructureFonctions',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des structurefonctions'
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
