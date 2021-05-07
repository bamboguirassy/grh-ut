import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { ResponsabiliteService } from '../responsabilite.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { Responsabilite } from '../responsabilite';

@Component({
  selector: 'app-responsabilite-clone',
  templateUrl: './responsabilite-clone.component.html',
  styleUrls: ['./responsabilite-clone.component.scss']
})
export class ResponsabiliteCloneComponent extends BasePageComponent<Responsabilite> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public responsabiliteSrv: ResponsabiliteService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, responsabiliteSrv);
    this.pageData = {
      title: 'Clonage - Responsabilite',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Responsabilites',
          route: '/'+this.orientation+'/responsabilite'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.responsabiliteSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: Responsabilite) {
    this.responsabiliteSrv.httpSrv.router.navigate([this.orientation,this.responsabiliteSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

