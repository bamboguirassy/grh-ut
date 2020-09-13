import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { TypeEntiteService } from '../typeentite.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { TypeEntite } from '../typeentite';

@Component({
  selector: 'app-typeentite-clone',
  templateUrl: './typeentite-clone.component.html',
  styleUrls: ['./typeentite-clone.component.scss']
})
export class TypeEntiteCloneComponent extends BasePageComponent<TypeEntite> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public typeEntiteSrv: TypeEntiteService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, typeEntiteSrv);
    this.pageData = {
      title: 'Clonage - TypeEntite',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'TypeEntites',
          route: '/'+this.orientation+'/typeentite'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.typeEntiteSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: TypeEntite) {
    this.typeEntiteSrv.httpSrv.router.navigate([this.orientation,this.typeEntiteSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

