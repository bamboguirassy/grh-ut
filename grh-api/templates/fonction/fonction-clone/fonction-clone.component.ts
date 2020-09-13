import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { FonctionService } from '../fonction.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { Fonction } from '../fonction';

@Component({
  selector: 'app-fonction-clone',
  templateUrl: './fonction-clone.component.html',
  styleUrls: ['./fonction-clone.component.scss']
})
export class FonctionCloneComponent extends BasePageComponent<Fonction> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public fonctionSrv: FonctionService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, fonctionSrv);
    this.pageData = {
      title: 'Clonage - Fonction',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Fonctions',
          route: '/'+this.orientation+'/fonction'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.fonctionSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: Fonction) {
    this.fonctionSrv.httpSrv.router.navigate([this.orientation,this.fonctionSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

