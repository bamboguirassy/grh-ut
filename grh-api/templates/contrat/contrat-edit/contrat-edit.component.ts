import { Component, OnInit, OnDestroy } from '@angular/core';
import { Contrat } from '../contrat';
import { ContratService } from '../contrat.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-contrat-edit',
  templateUrl: './contrat-edit.component.html',
  styleUrls: ['./contrat-edit.component.scss']
})
export class ContratEditComponent extends BasePageComponent<Contrat> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public contratSrv: ContratService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, contratSrv);
    this.pageData = {
      title: 'Modification - Contrat',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Contrats',
          route: '/'+this.orientation+'/contrat'
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
