import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { DiplomeService } from '../diplome.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { Diplome } from '../diplome';

@Component({
  selector: 'app-diplome-clone',
  templateUrl: './diplome-clone.component.html',
  styleUrls: ['./diplome-clone.component.scss']
})
export class DiplomeCloneComponent extends BasePageComponent<Diplome> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public diplomeSrv: DiplomeService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, diplomeSrv);
    this.pageData = {
      title: 'Clonage - Diplome',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Diplomes',
          route: '/'+this.orientation+'/diplome'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.diplomeSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: Diplome) {
    this.diplomeSrv.httpSrv.router.navigate([this.orientation,this.diplomeSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

