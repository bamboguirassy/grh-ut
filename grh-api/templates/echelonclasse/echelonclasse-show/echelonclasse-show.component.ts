import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { EchelonClasseService } from '../echelonclasse.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { EchelonClasse } from '../echelonclasse';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-echelonclasse-show',
  templateUrl: './echelonclasse-show.component.html',
  styleUrls: ['./echelonclasse-show.component.scss']
})
export class EchelonClasseShowComponent extends BasePageComponent<EchelonClasse> implements OnInit, OnDestroy {
  entity: EchelonClasse;

  constructor(store: Store<IAppState>,
    public echelonClasseSrv: EchelonClasseService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, echelonClasseSrv);
    this.pageData = {
      title: 'Détails - EchelonClasse',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'EchelonClasses',
          route: '/'+this.orientation+'/echelonclasse'
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
    this.title = 'EchelonClasse - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
