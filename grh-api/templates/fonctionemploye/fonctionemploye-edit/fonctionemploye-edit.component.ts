import { Component, OnInit, OnDestroy } from '@angular/core';
import { FonctionEmploye } from '../fonctionemploye';
import { FonctionEmployeService } from '../fonctionemploye.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-fonctionemploye-edit',
  templateUrl: './fonctionemploye-edit.component.html',
  styleUrls: ['./fonctionemploye-edit.component.scss']
})
export class FonctionEmployeEditComponent extends BasePageComponent<FonctionEmploye> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public fonctionEmployeSrv: FonctionEmployeService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, fonctionEmployeSrv);
    this.pageData = {
      title: 'Modification - FonctionEmploye',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'FonctionEmployes',
          route: '/'+this.orientation+'/fonctionemploye'
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
