import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { StructureService } from '../structure.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { Structure } from '../structure';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-structure-show',
  templateUrl: './structure-show.component.html',
  styleUrls: ['./structure-show.component.scss']
})
export class StructureShowComponent extends BasePageComponent<Structure> implements OnInit, OnDestroy {
  entity: Structure;

  constructor(store: Store<IAppState>,
    public structureSrv: StructureService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, structureSrv);
    this.pageData = {
      title: 'Détails - Structure',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Structures',
          route: '/'+this.orientation+'/structure'
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
    this.title =  this.entity?.nom;
  }

  handlePostDelete() {
    this.location.back();
  }

}
