import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { EchelonClasseService } from '../echelonclasse.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { EchelonClasse } from '../echelonclasse';

@Component({
  selector: 'app-echelonclasse-clone',
  templateUrl: './echelonclasse-clone.component.html',
  styleUrls: ['./echelonclasse-clone.component.scss']
})
export class EchelonClasseCloneComponent extends BasePageComponent<EchelonClasse> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public echelonClasseSrv: EchelonClasseService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, echelonClasseSrv);
    this.pageData = {
      title: 'Clonage - EchelonClasse',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'EchelonClasses',
          route: '/'+this.orientation+'/echelonclasse'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.echelonClasseSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: EchelonClasse) {
    this.echelonClasseSrv.httpSrv.router.navigate([this.orientation,this.echelonClasseSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

