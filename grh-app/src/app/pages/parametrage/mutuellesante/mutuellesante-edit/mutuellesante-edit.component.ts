import { Component, OnInit, OnDestroy } from '@angular/core';
import { MutuelleSante } from '../mutuellesante';
import { MutuelleSanteService } from '../mutuellesante.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-mutuellesante-edit',
  templateUrl: './mutuellesante-edit.component.html',
  styleUrls: ['./mutuellesante-edit.component.scss']
})
export class MutuelleSanteEditComponent extends BasePageComponent<MutuelleSante> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public mutuelleSanteSrv: MutuelleSanteService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, mutuelleSanteSrv);
    this.pageData = {
      title: 'Modification - Mutuelle de Santé',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des mutuelle de santé',
          route: '/'+this.orientation+'/mutuellesante'
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
