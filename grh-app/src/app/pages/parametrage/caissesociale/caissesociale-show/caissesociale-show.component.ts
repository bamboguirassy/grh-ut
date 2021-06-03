import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { CaisseSocialeService } from '../caissesociale.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { CaisseSociale } from '../caissesociale';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-caissesociale-show',
  templateUrl: './caissesociale-show.component.html',
  styleUrls: ['./caissesociale-show.component.scss']
})
export class CaisseSocialeShowComponent extends BasePageComponent<CaisseSociale> implements OnInit, OnDestroy {
  entity: CaisseSociale;

  constructor(store: Store<IAppState>,
    public caisseSocialeSrv: CaisseSocialeService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, caisseSocialeSrv);
    this.pageData = {
      title: 'Détails - Caisse Sociale',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Caisse Sociales',
          route: '/'+this.orientation+'/caissesociale'
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
    this.title = 'Caisse Sociale ' + this.entity?.code;
  }

  handlePostDelete() {
    this.location.back();
  }

}
