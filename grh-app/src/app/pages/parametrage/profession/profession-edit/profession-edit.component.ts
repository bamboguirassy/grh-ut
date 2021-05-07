import { Component, OnInit, OnDestroy } from '@angular/core';
import { Profession } from '../profession';
import { ProfessionService } from '../profession.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-profession-edit',
  templateUrl: './profession-edit.component.html',
  styleUrls: ['./profession-edit.component.scss']
})
export class ProfessionEditComponent extends BasePageComponent<Profession> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public professionSrv: ProfessionService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, professionSrv);
    this.pageData = {
      title: 'Modification - Profession',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Professions',
          route: '/'+this.orientation+'/profession'
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
