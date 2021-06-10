import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { RangService } from '../rang.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { Rang } from '../rang';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-rang-show',
  templateUrl: './rang-show.component.html',
  styleUrls: ['./rang-show.component.scss']
})
export class RangShowComponent extends BasePageComponent<Rang> implements OnInit, OnDestroy {
  entity: Rang;

  constructor(store: Store<IAppState>,
    public rangSrv: RangService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, rangSrv);
    this.pageData = {
      title: 'Détails - Rang',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Rangs',
          route: '/'+this.orientation+'/rang'
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
    this.title = 'Rang - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
