import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { MembreSyndicatService } from '../membresyndicat.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { MembreSyndicat } from '../membresyndicat';

@Component({
  selector: 'app-membresyndicat-clone',
  templateUrl: './membresyndicat-clone.component.html',
  styleUrls: ['./membresyndicat-clone.component.scss']
})
export class MembreSyndicatCloneComponent extends BasePageComponent<MembreSyndicat> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public membreSyndicatSrv: MembreSyndicatService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, membreSyndicatSrv);
    this.pageData = {
      title: 'Clonage - MembreSyndicat',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'MembreSyndicats',
          route: '/'+this.orientation+'/membresyndicat'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.membreSyndicatSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: MembreSyndicat) {
    this.membreSyndicatSrv.httpSrv.router.navigate([this.orientation,this.membreSyndicatSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

