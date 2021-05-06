import { Component, OnInit, OnDestroy } from '@angular/core';
import { Responsabilite } from '../responsabilite';
import { ResponsabiliteService } from '../responsabilite.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-responsabilite-edit',
  templateUrl: './responsabilite-edit.component.html',
  styleUrls: ['./responsabilite-edit.component.scss']
})
export class ResponsabiliteEditComponent extends BasePageComponent<Responsabilite> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public responsabiliteSrv: ResponsabiliteService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, responsabiliteSrv);
    this.pageData = {
      title: 'Modification - Responsabilite',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Responsabilites',
          route: '/'+this.orientation+'/responsabilite'
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
