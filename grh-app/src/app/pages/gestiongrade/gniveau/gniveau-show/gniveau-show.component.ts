import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { GNiveauService } from '../gniveau.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { GNiveau } from '../gniveau';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-gniveau-show',
  templateUrl: './gniveau-show.component.html',
  styleUrls: ['./gniveau-show.component.scss']
})
export class GNiveauShowComponent extends BasePageComponent<GNiveau> implements OnInit, OnDestroy {
  entity: GNiveau;

  constructor(store: Store<IAppState>,
    public gNiveauSrv: GNiveauService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, gNiveauSrv);
    this.pageData = {
      title: 'Détails - GNiveau',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des gniveaux',
          route: '/'+this.orientation+'/gniveau'
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
    this.title = 'GNiveau - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
