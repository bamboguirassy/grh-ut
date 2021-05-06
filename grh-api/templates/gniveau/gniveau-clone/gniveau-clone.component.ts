import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { GNiveauService } from '../gniveau.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { GNiveau } from '../gniveau';

@Component({
  selector: 'app-gniveau-clone',
  templateUrl: './gniveau-clone.component.html',
  styleUrls: ['./gniveau-clone.component.scss']
})
export class GNiveauCloneComponent extends BasePageComponent<GNiveau> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public gNiveauSrv: GNiveauService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, gNiveauSrv);
    this.pageData = {
      title: 'Clonage - GNiveau',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'GNiveaus',
          route: '/'+this.orientation+'/gniveau'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.gNiveauSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: GNiveau) {
    this.gNiveauSrv.httpSrv.router.navigate([this.orientation,this.gNiveauSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

