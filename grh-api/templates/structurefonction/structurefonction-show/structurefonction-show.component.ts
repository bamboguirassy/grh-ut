import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { StructureFonctionService } from '../structurefonction.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { StructureFonction } from '../structurefonction';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-structurefonction-show',
  templateUrl: './structurefonction-show.component.html',
  styleUrls: ['./structurefonction-show.component.scss']
})
export class StructureFonctionShowComponent extends BasePageComponent<StructureFonction> implements OnInit, OnDestroy {
  entity: StructureFonction;

  constructor(store: Store<IAppState>,
    public structureFonctionSrv: StructureFonctionService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, structureFonctionSrv);
    this.pageData = {
      title: 'Détails - StructureFonction',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'StructureFonctions',
          route: '/'+this.orientation+'/structurefonction'
        },
        {
          title: 'Affichage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findEntity(this.activatedRoute.snapshot.params.id);
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.title = 'StructureFonction - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
