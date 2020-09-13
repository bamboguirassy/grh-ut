import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { TypeContratService } from '../typecontrat.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { TypeContrat } from '../typecontrat';

@Component({
  selector: 'app-typecontrat-clone',
  templateUrl: './typecontrat-clone.component.html',
  styleUrls: ['./typecontrat-clone.component.scss']
})
export class TypeContratCloneComponent extends BasePageComponent<TypeContrat> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public typeContratSrv: TypeContratService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, typeContratSrv);
    this.pageData = {
      title: 'Clonage - TypeContrat',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'TypeContrats',
          route: '/'+this.orientation+'/typecontrat'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.typeContratSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: TypeContrat) {
    this.typeContratSrv.httpSrv.router.navigate([this.orientation,this.typeContratSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

