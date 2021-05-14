import { Component, OnInit, OnDestroy } from '@angular/core';
import { MembreSyndicat } from '../membresyndicat';
import { MembreSyndicatService } from '../membresyndicat.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-membresyndicat-edit',
  templateUrl: './membresyndicat-edit.component.html',
  styleUrls: ['./membresyndicat-edit.component.scss']
})
export class MembreSyndicatEditComponent extends BasePageComponent<MembreSyndicat> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public membreSyndicatSrv: MembreSyndicatService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, membreSyndicatSrv);
    this.pageData = {
      title: 'Modification - MembreSyndicat',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'MembreSyndicats',
          route: '/'+this.orientation+'/membresyndicat'
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
