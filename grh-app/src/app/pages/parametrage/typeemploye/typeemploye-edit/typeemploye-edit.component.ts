import { Component, OnInit, OnDestroy } from '@angular/core';
import { TypeEmploye } from '../typeemploye';
import { TypeEmployeService } from '../typeemploye.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-typeemploye-edit',
  templateUrl: './typeemploye-edit.component.html',
  styleUrls: ['./typeemploye-edit.component.scss']
})
export class TypeEmployeEditComponent extends BasePageComponent<TypeEmploye> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public typeEmployeSrv: TypeEmployeService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, typeEmployeSrv);
    this.pageData = {
      title: 'Modification - TypeEmploye',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'TypeEmployes',
          route: '/'+this.orientation+'/typeemploye'
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
