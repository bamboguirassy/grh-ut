import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { RangService } from '../rang.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { Rang } from '../rang';

@Component({
  selector: 'app-rang-clone',
  templateUrl: './rang-clone.component.html',
  styleUrls: ['./rang-clone.component.scss']
})
export class RangCloneComponent extends BasePageComponent<Rang> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public rangSrv: RangService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, rangSrv);
    this.pageData = {
      title: 'Clonage - Rang',
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
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.rangSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: Rang) {
    this.rangSrv.httpSrv.router.navigate([this.orientation,this.rangSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

