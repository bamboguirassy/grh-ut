import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { GClasseService } from '../gclasse.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { GClasse } from '../gclasse';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-gclasse-show',
  templateUrl: './gclasse-show.component.html',
  styleUrls: ['./gclasse-show.component.scss']
})
export class GClasseShowComponent extends BasePageComponent<GClasse> implements OnInit, OnDestroy {
  entity: GClasse;

  constructor(store: Store<IAppState>,
    public gClasseSrv: GClasseService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, gClasseSrv);
    this.pageData = {
      title: 'Détails - Classe',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des classes',
          route: '/'+this.orientation+'/gclasse'
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
    this.title = 'Classe - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
