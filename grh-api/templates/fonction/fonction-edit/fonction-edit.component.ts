import { Component, OnInit, OnDestroy } from '@angular/core';
import { Fonction } from '../fonction';
import { FonctionService } from '../fonction.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-fonction-edit',
  templateUrl: './fonction-edit.component.html',
  styleUrls: ['./fonction-edit.component.scss']
})
export class FonctionEditComponent extends BasePageComponent<Fonction> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public fonctionSrv: FonctionService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, fonctionSrv);
    this.pageData = {
      title: 'Modification - Fonction',
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
