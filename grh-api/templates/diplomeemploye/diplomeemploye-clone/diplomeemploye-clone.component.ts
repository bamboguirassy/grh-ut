import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { DiplomeEmployeService } from '../diplomeemploye.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { DiplomeEmploye } from '../diplomeemploye';

@Component({
  selector: 'app-diplomeemploye-clone',
  templateUrl: './diplomeemploye-clone.component.html',
  styleUrls: ['./diplomeemploye-clone.component.scss']
})
export class DiplomeEmployeCloneComponent extends BasePageComponent<DiplomeEmploye> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public diplomeEmployeSrv: DiplomeEmployeService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, diplomeEmployeSrv);
    this.pageData = {
      title: 'Clonage - DiplomeEmploye',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'DiplomeEmployes',
          route: '/'+this.orientation+'/diplomeemploye'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.diplomeEmployeSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: DiplomeEmploye) {
    this.diplomeEmployeSrv.httpSrv.router.navigate([this.orientation,this.diplomeEmployeSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

