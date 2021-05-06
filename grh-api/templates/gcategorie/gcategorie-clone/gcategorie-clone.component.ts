import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { GCategorieService } from '../gcategorie.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { GCategorie } from '../gcategorie';

@Component({
  selector: 'app-gcategorie-clone',
  templateUrl: './gcategorie-clone.component.html',
  styleUrls: ['./gcategorie-clone.component.scss']
})
export class GCategorieCloneComponent extends BasePageComponent<GCategorie> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public gCategorieSrv: GCategorieService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, gCategorieSrv);
    this.pageData = {
      title: 'Clonage - GCategorie',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'GCategories',
          route: '/'+this.orientation+'/gcategorie'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.gCategorieSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: GCategorie) {
    this.gCategorieSrv.httpSrv.router.navigate([this.orientation,this.gCategorieSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

