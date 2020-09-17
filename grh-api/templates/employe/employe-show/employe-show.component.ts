import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { EmployeService } from '../employe.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { Employe } from '../employe';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-employe-show',
  templateUrl: './employe-show.component.html',
  styleUrls: ['./employe-show.component.scss']
})
export class EmployeShowComponent extends BasePageComponent<Employe> implements OnInit, OnDestroy {
  entity: Employe;

  constructor(store: Store<IAppState>,
    public employeSrv: EmployeService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, employeSrv);
    this.pageData = {
      title: 'Détails - Employe',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Employes',
          route: '/'+this.orientation+'/employe'
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
    this.title = 'Employe - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
