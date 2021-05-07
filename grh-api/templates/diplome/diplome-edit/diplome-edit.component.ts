import { Component, OnInit, OnDestroy } from '@angular/core';
import { Diplome } from '../diplome';
import { DiplomeService } from '../diplome.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-diplome-edit',
  templateUrl: './diplome-edit.component.html',
  styleUrls: ['./diplome-edit.component.scss']
})
export class DiplomeEditComponent extends BasePageComponent<Diplome> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public diplomeSrv: DiplomeService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, diplomeSrv);
    this.pageData = {
      title: 'Modification - Diplome',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Diplomes',
          route: '/'+this.orientation+'/diplome'
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
