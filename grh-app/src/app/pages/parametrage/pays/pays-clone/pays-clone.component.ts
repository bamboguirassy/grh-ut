import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { PaysService } from '../pays.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { Pays } from '../pays';

@Component({
  selector: 'app-pays-clone',
  templateUrl: './pays-clone.component.html',
  styleUrls: ['./pays-clone.component.scss']
})
export class PaysCloneComponent extends BasePageComponent<Pays> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public paySrv: PaysService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, paySrv);
    this.pageData = {
      title: 'Clonage - Pays',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Payss',
          route: '/'+this.orientation+'/pays'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.paySrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: Pays) {
    this.paySrv.httpSrv.router.navigate([this.orientation,this.paySrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

