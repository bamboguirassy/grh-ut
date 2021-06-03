import { DatePipe } from '@angular/common';
import { Component, OnDestroy, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { SETTINGS } from 'src/environments/settings';
import { Employe } from '../../employe/employe';
import { EmployeService } from '../../employe/employe.service';
import { FonctionEmploye } from '../fonctionemploye';
import { FonctionEmployeService } from '../fonctionemploye.service';

@Component({
  selector: 'app-fonction-en-expiration',
  templateUrl: './fonction-en-expiration.component.html',
  styleUrls: ['./fonction-en-expiration.component.scss']
})
export class FonctionEnExpirationComponent extends BasePageComponent<FonctionEmploye> implements OnInit, OnDestroy {
  items: FonctionEmploye[] = [];
  secondViewBorder = 'warning';
  lightGradient = ['#fff', SETTINGS.topbarBg];

  constructor(store: Store<IAppState>,
    public fonctionEmployeSrv: FonctionEmployeService,
    public employeSrv: EmployeService,
    public datePipe: DatePipe, private router: Router) {
    super(store, fonctionEmployeSrv);
    this.setLoaded();
    this.pageData = {
      title: 'Liste des fonctions actives à durée limitée',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des fonctions actives'
        }
      ]
    };
  }


  /**
   * Permet d'avoir le route pour voir les infos de l'employé
   * @param employe employe
   * @returns route
   */
  employeRoute(employe: Employe): string[] {
    let url: string = this.router.url;
    return ["/" + url.split("/")[1] + "/employe/" + employe.id];
  }


  onClose() {
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findAll();
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  findAll() {
    this.fonctionEmployeSrv.findNonExpiree()
      .subscribe((data: any) => {
        this.items = data;
      }, err => this.fonctionEmployeSrv.httpSrv.catchError(err));
  }


}
