import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { EmployeService } from '../employe.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { Employe } from '../employe';

@Component({
  selector: 'app-employe-clone',
  templateUrl: './employe-clone.component.html',
  styleUrls: ['./employe-clone.component.scss']
})
export class EmployeCloneComponent extends BasePageComponent<Employe> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public employeSrv: EmployeService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, employeSrv);
    this.pageData = {
      title: 'Clonage - Employe',
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
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.employeSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: Employe) {
    this.employeSrv.httpSrv.router.navigate([this.orientation,this.employeSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

