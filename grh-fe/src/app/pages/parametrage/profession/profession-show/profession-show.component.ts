import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { ProfessionService } from '../profession.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { Profession } from '../profession';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-profession-show',
  templateUrl: './profession-show.component.html',
  styleUrls: ['./profession-show.component.scss']
})
export class ProfessionShowComponent extends BasePageComponent<Profession> implements OnInit, OnDestroy {
  entity: Profession;

  constructor(store: Store<IAppState>,
    public professionSrv: ProfessionService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, professionSrv);
    this.pageData = {
      title: 'Détails - Profession',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'listes des professions',
          route: '/'+this.orientation+'/profession'
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
    this.title = 'Profession - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
