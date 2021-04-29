import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { EmployeService } from '../employe.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { Employe } from '../employe';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { FonctionEmployeService } from '../../fonctionemploye/fonctionemploye.service';
import { first } from 'rxjs/operators';
import { FonctionEmploye } from '../../fonctionemploye/fonctionemploye';

@Component({
  selector: 'app-employe-show',
  templateUrl: './employe-show.component.html',
  styleUrls: ['./employe-show.component.scss']
})
export class EmployeShowComponent extends BasePageComponent<Employe> implements OnInit, OnDestroy {
  entity: Employe;
  latestFonction: FonctionEmploye;

  constructor(store: Store<IAppState>,
    public employeSrv: EmployeService, public fonctionEmployeSrv: FonctionEmployeService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, employeSrv);
    this.pageData = {
      title: 'Dossier - Employé',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Employés',
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
    this.title = this.entity?.prenoms+' '+this.entity?.nom+' ('+this.entity?.matricule+')';
    this.findLatestFonction();
  }

  handlePostDelete() {
    this.location.back();
  }

  findLatestFonction() {
    this
    .fonctionEmployeSrv
    .findLatest(this.entity)
    .pipe(first())
    .subscribe((fonctionEmploye: any) => {
      this.latestFonction = fonctionEmploye;
    }, err => {
      this.fonctionEmployeSrv.httpSrv.handleError(err);
    })
  }

}
