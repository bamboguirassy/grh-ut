import { Component, OnInit, OnDestroy } from '@angular/core';
import { GEchelon } from '../gechelon';
import { GEchelonService } from '../gechelon.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-gechelon-edit',
  templateUrl: './gechelon-edit.component.html',
  styleUrls: ['./gechelon-edit.component.scss']
})
export class GEchelonEditComponent extends BasePageComponent<GEchelon> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public gEchelonSrv: GEchelonService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, gEchelonSrv);
    this.pageData = {
      title: 'Modification - GEchelon',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des géchelons',
          route: '/'+this.orientation+'/gechelon'
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
