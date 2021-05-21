import { Component, OnInit, OnDestroy } from '@angular/core';
import { Syndicat } from '../syndicat';
import { SyndicatService } from '../syndicat.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';
import { type } from 'os';

@Component({
  selector: 'app-syndicat-edit',
  templateUrl: './syndicat-edit.component.html',
  styleUrls: ['./syndicat-edit.component.scss']
})
export class SyndicatEditComponent extends BasePageComponent<Syndicat> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
    public syndicatSrv: SyndicatService,
    public router: Router,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, syndicatSrv);
    this.pageData = {
      title: 'Modification - Syndicat',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des syndicats',
          route: '/' + this.orientation + '/syndicat'
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
