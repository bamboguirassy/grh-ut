import { Component, OnInit, OnDestroy } from '@angular/core';
import { CaisseSociale } from '../caissesociale';
import { CaisseSocialeService } from '../caissesociale.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-caissesociale-edit',
  templateUrl: './caissesociale-edit.component.html',
  styleUrls: ['./caissesociale-edit.component.scss']
})
export class CaisseSocialeEditComponent extends BasePageComponent<CaisseSociale> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public caisseSocialeSrv: CaisseSocialeService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, caisseSocialeSrv);
    this.pageData = {
      title: 'Modification - CaisseSociale',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'CaisseSociales',
          route: '/'+this.orientation+'/caissesociale'
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
