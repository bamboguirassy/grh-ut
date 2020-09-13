import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { TypeContratService } from '../typecontrat.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { TypeContrat } from '../typecontrat';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-typecontrat-show',
  templateUrl: './typecontrat-show.component.html',
  styleUrls: ['./typecontrat-show.component.scss']
})
export class TypeContratShowComponent extends BasePageComponent<TypeContrat> implements OnInit, OnDestroy {
  entity: TypeContrat;

  constructor(store: Store<IAppState>,
    public typeContratSrv: TypeContratService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, typeContratSrv);
    this.pageData = {
      title: 'Détails - TypeContrat',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'TypeContrats',
          route: '/'+this.orientation+'/typecontrat'
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
    this.title = 'TypeContrat - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
