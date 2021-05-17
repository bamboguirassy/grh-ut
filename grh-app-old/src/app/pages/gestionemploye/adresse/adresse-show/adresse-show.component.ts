import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { AdresseService } from '../adresse.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { Adresse } from '../adresse';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-adresse-show',
  templateUrl: './adresse-show.component.html',
  styleUrls: ['./adresse-show.component.scss']
})
export class AdresseShowComponent extends BasePageComponent<Adresse> implements OnInit, OnDestroy {
  entity: Adresse;

  constructor(store: Store<IAppState>,
    public adresseSrv: AdresseService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, adresseSrv);
    this.pageData = {
      title: 'Détails - Adresse',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Adresses',
          route: '/'+this.orientation+'/adresse'
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
    this.title = 'Adresse - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
