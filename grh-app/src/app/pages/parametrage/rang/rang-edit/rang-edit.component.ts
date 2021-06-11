import { Component, OnInit, OnDestroy } from '@angular/core';
import { Rang } from '../rang';
import { RangService } from '../rang.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-rang-edit',
  templateUrl: './rang-edit.component.html',
  styleUrls: ['./rang-edit.component.scss']
})
export class RangEditComponent extends BasePageComponent<Rang> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public rangSrv: RangService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, rangSrv);
    this.pageData = {
      title: 'Modification - Rang',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Rangs',
          route: '/'+this.orientation+'/rang'
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
