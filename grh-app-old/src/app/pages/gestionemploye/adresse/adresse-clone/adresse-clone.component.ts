import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { AdresseService } from '../adresse.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { Adresse } from '../adresse';

@Component({
  selector: 'app-adresse-clone',
  templateUrl: './adresse-clone.component.html',
  styleUrls: ['./adresse-clone.component.scss']
})
export class AdresseCloneComponent extends BasePageComponent<Adresse> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public adresseSrv: AdresseService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, adresseSrv);
    this.pageData = {
      title: 'Clonage - Adresse',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Adresses',
          route: '/'+this.orientation+'/adresse'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.adresseSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: Adresse) {
    this.adresseSrv.httpSrv.router.navigate([this.orientation,this.adresseSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

