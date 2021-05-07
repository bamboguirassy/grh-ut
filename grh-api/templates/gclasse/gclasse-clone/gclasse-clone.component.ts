import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { GClasseService } from '../gclasse.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { GClasse } from '../gclasse';

@Component({
  selector: 'app-gclasse-clone',
  templateUrl: './gclasse-clone.component.html',
  styleUrls: ['./gclasse-clone.component.scss']
})
export class GClasseCloneComponent extends BasePageComponent<GClasse> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public gClasseSrv: GClasseService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, gClasseSrv);
    this.pageData = {
      title: 'Clonage - GClasse',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'GClasses',
          route: '/'+this.orientation+'/gclasse'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.gClasseSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: GClasse) {
    this.gClasseSrv.httpSrv.router.navigate([this.orientation,this.gClasseSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

