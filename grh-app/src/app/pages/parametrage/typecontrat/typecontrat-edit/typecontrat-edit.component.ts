import { Component, OnInit, OnDestroy } from '@angular/core';
import { TypeContrat } from '../typecontrat';
import { TypeContratService } from '../typecontrat.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';
import * as ClassicEditor from '@ckeditor/ckeditor5-build-classic';


@Component({
  selector: 'app-typecontrat-edit',
  templateUrl: './typecontrat-edit.component.html',
  styleUrls: ['./typecontrat-edit.component.scss']
})
export class TypeContratEditComponent extends BasePageComponent<TypeContrat> implements OnInit, OnDestroy {

  editor = ClassicEditor;

  constructor(store: Store<IAppState>,
              public typeContratSrv: TypeContratService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, typeContratSrv);
    this.pageData = {
      title: 'Modification - Type de contrat',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Types de Contrat',
          route: '/'+this.orientation+'/typecontrat'
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
