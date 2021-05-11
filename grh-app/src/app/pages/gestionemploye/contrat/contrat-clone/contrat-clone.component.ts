import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { ContratService } from '../contrat.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { Contrat } from '../contrat';

@Component({
  selector: 'app-contrat-clone',
  templateUrl: './contrat-clone.component.html',
  styleUrls: ['./contrat-clone.component.scss']
})
export class ContratCloneComponent extends BasePageComponent<Contrat> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public contratSrv: ContratService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, contratSrv);
    this.pageData = {
      title: 'Clonage - Contrat',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Contrats',
          route: '/'+this.orientation+'/contrat'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.contratSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: Contrat) {
    this.contratSrv.httpSrv.router.navigate([this.orientation,this.contratSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

