import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { PaysService } from '../pays.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { Pays } from '../pays';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-pays-show',
  templateUrl: './pays-show.component.html',
  styleUrls: ['./pays-show.component.scss']
})
export class PaysShowComponent extends BasePageComponent<Pays> implements OnInit, OnDestroy {
  entity: Pays;

  constructor(store: Store<IAppState>,
    public paySrv: PaysService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, paySrv);
    this.pageData = {
      title: 'Détails - Pays',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Payss',
          route: '/'+this.orientation+'/pays'
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
    this.title = 'Pays - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
