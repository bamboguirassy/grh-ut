import { Component, OnInit, OnDestroy } from '@angular/core';
import { TypeEntite } from '../typeentite';
import { TypeEntiteService } from '../typeentite.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-typeentite-edit',
  templateUrl: './typeentite-edit.component.html',
  styleUrls: ['./typeentite-edit.component.scss']
})
export class TypeEntiteEditComponent extends BasePageComponent<TypeEntite> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public typeEntiteSrv: TypeEntiteService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, typeEntiteSrv);
    this.pageData = {
      title: 'Modification - Type Entité',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Type Entités',
          route: '/'+this.orientation+'/typeentite'
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
