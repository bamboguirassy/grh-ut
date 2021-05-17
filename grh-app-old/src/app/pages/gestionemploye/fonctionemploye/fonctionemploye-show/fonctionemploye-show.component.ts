import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { FonctionEmployeService } from '../fonctionemploye.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { FonctionEmploye } from '../fonctionemploye';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-fonctionemploye-show',
  templateUrl: './fonctionemploye-show.component.html',
  styleUrls: ['./fonctionemploye-show.component.scss']
})
export class FonctionEmployeShowComponent extends BasePageComponent<FonctionEmploye> implements OnInit, OnDestroy {
  entity: FonctionEmploye;

  constructor(store: Store<IAppState>,
    public fonctionEmployeSrv: FonctionEmployeService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, fonctionEmployeSrv);
    this.pageData = {
      title: 'Détails - FonctionEmploye',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'FonctionEmployes',
          route: '/'+this.orientation+'/fonctionemploye'
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
    this.title = 'FonctionEmploye - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
