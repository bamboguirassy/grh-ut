import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { DiplomeEmployeService } from '../diplomeemploye.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { DiplomeEmploye } from '../diplomeemploye';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-diplomeemploye-show',
  templateUrl: './diplomeemploye-show.component.html',
  styleUrls: ['./diplomeemploye-show.component.scss']
})
export class DiplomeEmployeShowComponent extends BasePageComponent<DiplomeEmploye> implements OnInit, OnDestroy {
  entity: DiplomeEmploye;

  constructor(store: Store<IAppState>,
    public diplomeEmployeSrv: DiplomeEmployeService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, diplomeEmployeSrv);
    this.pageData = {
      title: 'Détails - DiplomeEmploye',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'DiplomeEmployes',
          route: '/'+this.orientation+'/diplomeemploye'
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
    this.title = 'DiplomeEmploye - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
