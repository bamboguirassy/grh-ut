import { Component, OnInit, OnDestroy } from '@angular/core';
import { GClasse } from '../gclasse';
import { GClasseService } from '../gclasse.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-gclasse-edit',
  templateUrl: './gclasse-edit.component.html',
  styleUrls: ['./gclasse-edit.component.scss']
})
export class GClasseEditComponent extends BasePageComponent<GClasse> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public gClasseSrv: GClasseService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, gClasseSrv);
    this.pageData = {
      title: 'Modification - Classe',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des classes',
          route: '/'+this.orientation+'/gclasse'
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
