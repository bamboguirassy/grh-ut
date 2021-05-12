import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { TypeEmployeService } from '../typeemploye.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { TypeEmploye } from '../typeemploye';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-typeemploye-show',
  templateUrl: './typeemploye-show.component.html',
  styleUrls: ['./typeemploye-show.component.scss']
})
export class TypeEmployeShowComponent extends BasePageComponent<TypeEmploye> implements OnInit, OnDestroy {
  entity: TypeEmploye;

  constructor(store: Store<IAppState>,
    public typeEmployeSrv: TypeEmployeService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, typeEmployeSrv);
    this.pageData = {
      title: 'Détails - TypeEmploye',
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
          title: 'Affichage'
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
    this.title = 'TypeEmploye - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
