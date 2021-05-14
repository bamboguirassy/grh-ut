import { Component, OnInit, OnDestroy } from '@angular/core';
import { Adresse } from '../adresse';
import { AdresseService } from '../adresse.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-adresse-edit',
  templateUrl: './adresse-edit.component.html',
  styleUrls: ['./adresse-edit.component.scss']
})
export class AdresseEditComponent extends BasePageComponent<Adresse> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public adresseSrv: AdresseService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, adresseSrv);
    this.pageData = {
      title: 'Modification - Adresse',
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
          title: 'Modification'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findEntity(this.activatedRoute.snapshot.params.id);
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
  }

  prepareUpdate() {
  }

  handlePostUpdate() {
    this.location.back();
  }

}
