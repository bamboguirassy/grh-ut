import { Component, OnInit, OnDestroy } from '@angular/core';
import { Pays } from '../pays';
import { PaysService } from '../pays.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-pays-edit',
  templateUrl: './pays-edit.component.html',
  styleUrls: ['./pays-edit.component.scss']
})
export class PaysEditComponent extends BasePageComponent<Pays> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public paySrv: PaysService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, paySrv);
    this.pageData = {
      title: 'Modification - Pays',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Payss',
          route: '/'+this.orientation+'/pays'
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
