import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { ContratService } from '../contrat.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { Contrat } from '../contrat';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-contrat-show',
  templateUrl: './contrat-show.component.html',
  styleUrls: ['./contrat-show.component.scss']
})
export class ContratShowComponent extends BasePageComponent<Contrat> implements OnInit, OnDestroy {
  entity: Contrat;

  constructor(store: Store<IAppState>,
    public contratSrv: ContratService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, contratSrv);
    this.pageData = {
      title: 'Détails - Contrat',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Contrats',
          route: '/'+this.orientation+'/contrat'
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
    this.title = 'Contrat - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
