import { Component, OnInit, OnDestroy } from '@angular/core';
import { EchelonClasse } from '../echelonclasse';
import { EchelonClasseService } from '../echelonclasse.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-echelonclasse-edit',
  templateUrl: './echelonclasse-edit.component.html',
  styleUrls: ['./echelonclasse-edit.component.scss']
})
export class EchelonClasseEditComponent extends BasePageComponent<EchelonClasse> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public echelonClasseSrv: EchelonClasseService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, echelonClasseSrv);
    this.pageData = {
      title: 'Modification - EchelonClasse',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'EchelonClasses',
          route: '/'+this.orientation+'/echelonclasse'
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
