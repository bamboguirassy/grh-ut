import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { MembreFamilleService } from '../membrefamille.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { MembreFamille } from '../membrefamille';

@Component({
  selector: 'app-membrefamille-clone',
  templateUrl: './membrefamille-clone.component.html',
  styleUrls: ['./membrefamille-clone.component.scss']
})
export class MembreFamilleCloneComponent extends BasePageComponent<MembreFamille> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public membreFamilleSrv: MembreFamilleService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, membreFamilleSrv);
    this.pageData = {
      title: 'Clonage - MembreFamille',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'MembreFamilles',
          route: '/'+this.orientation+'/membrefamille'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.membreFamilleSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: MembreFamille) {
    this.membreFamilleSrv.httpSrv.router.navigate([this.orientation,this.membreFamilleSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

