import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { GEchelonService } from '../gechelon.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { GEchelon } from '../gechelon';

@Component({
  selector: 'app-gechelon-clone',
  templateUrl: './gechelon-clone.component.html',
  styleUrls: ['./gechelon-clone.component.scss']
})
export class GEchelonCloneComponent extends BasePageComponent<GEchelon> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public gEchelonSrv: GEchelonService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, gEchelonSrv);
    this.pageData = {
      title: 'Clonage - GEchelon',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'GEchelons',
          route: '/'+this.orientation+'/gechelon'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.gEchelonSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: GEchelon) {
    this.gEchelonSrv.httpSrv.router.navigate([this.orientation,this.gEchelonSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

