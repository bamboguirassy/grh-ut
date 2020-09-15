import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { SyndicatService } from '../syndicat.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { Syndicat } from '../syndicat';

@Component({
  selector: 'app-syndicat-clone',
  templateUrl: './syndicat-clone.component.html',
  styleUrls: ['./syndicat-clone.component.scss']
})
export class SyndicatCloneComponent extends BasePageComponent<Syndicat> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public syndicatSrv: SyndicatService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, syndicatSrv);
    this.pageData = {
      title: 'Clonage - Syndicat',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Syndicats',
          route: '/'+this.orientation+'/syndicat'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.syndicatSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: Syndicat) {
    this.syndicatSrv.httpSrv.router.navigate([this.orientation,this.syndicatSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

