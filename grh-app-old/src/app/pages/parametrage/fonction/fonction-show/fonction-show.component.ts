import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { FonctionService } from '../fonction.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { Fonction } from '../fonction';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-fonction-show',
  templateUrl: './fonction-show.component.html',
  styleUrls: ['./fonction-show.component.scss']
})
export class FonctionShowComponent extends BasePageComponent<Fonction> implements OnInit, OnDestroy {
  entity: Fonction;

  constructor(store: Store<IAppState>,
    public fonctionSrv: FonctionService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, fonctionSrv);
    this.pageData = {
      title: 'Détails - Fonction',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Fonctions',
          route: '/'+this.orientation+'/fonction'
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
    this.title = 'Fonction - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
