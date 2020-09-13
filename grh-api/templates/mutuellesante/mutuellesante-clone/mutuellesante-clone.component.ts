import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { MutuelleSanteService } from '../mutuellesante.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { MutuelleSante } from '../mutuellesante';

@Component({
  selector: 'app-mutuellesante-clone',
  templateUrl: './mutuellesante-clone.component.html',
  styleUrls: ['./mutuellesante-clone.component.scss']
})
export class MutuelleSanteCloneComponent extends BasePageComponent<MutuelleSante> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public mutuelleSanteSrv: MutuelleSanteService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, mutuelleSanteSrv);
    this.pageData = {
      title: 'Clonage - MutuelleSante',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'MutuelleSantes',
          route: '/'+this.orientation+'/mutuellesante'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.mutuelleSanteSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: MutuelleSante) {
    this.mutuelleSanteSrv.httpSrv.router.navigate([this.orientation,this.mutuelleSanteSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

