import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { MembreFamilleService } from '../membrefamille.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { MembreFamille } from '../membrefamille';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-membrefamille-show',
  templateUrl: './membrefamille-show.component.html',
  styleUrls: ['./membrefamille-show.component.scss']
})
export class MembreFamilleShowComponent extends BasePageComponent<MembreFamille> implements OnInit, OnDestroy {
  entity: MembreFamille;

  constructor(store: Store<IAppState>,
    public membreFamilleSrv: MembreFamilleService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, membreFamilleSrv);
    this.pageData = {
      title: 'Détails - MembreFamille',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'MembreFamilles',
          route: '/'+this.orientation+'/membrefamille'
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
    this.title = 'MembreFamille - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
