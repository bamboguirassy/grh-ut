import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { CaisseSocialeService } from '../caissesociale.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { CaisseSociale } from '../caissesociale';

@Component({
  selector: 'app-caissesociale-clone',
  templateUrl: './caissesociale-clone.component.html',
  styleUrls: ['./caissesociale-clone.component.scss']
})
export class CaisseSocialeCloneComponent extends BasePageComponent<CaisseSociale> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public caisseSocialeSrv: CaisseSocialeService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, caisseSocialeSrv);
    this.pageData = {
      title: 'Clonage - CaisseSociale',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'CaisseSociales',
          route: '/'+this.orientation+'/caissesociale'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.caisseSocialeSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: CaisseSociale) {
    this.caisseSocialeSrv.httpSrv.router.navigate([this.orientation,this.caisseSocialeSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

