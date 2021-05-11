import { Component, OnInit, OnDestroy } from '@angular/core';
import { DiplomeEmploye } from '../diplomeemploye';
import { DiplomeEmployeService } from '../diplomeemploye.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-diplomeemploye-edit',
  templateUrl: './diplomeemploye-edit.component.html',
  styleUrls: ['./diplomeemploye-edit.component.scss']
})
export class DiplomeEmployeEditComponent extends BasePageComponent<DiplomeEmploye> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public diplomeEmployeSrv: DiplomeEmployeService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, diplomeEmployeSrv);
    this.pageData = {
      title: 'Modification - DiplomeEmploye',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'DiplomeEmployes',
          route: '/'+this.orientation+'/diplomeemploye'
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
