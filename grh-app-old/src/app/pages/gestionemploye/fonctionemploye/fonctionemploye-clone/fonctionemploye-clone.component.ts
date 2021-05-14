import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { FonctionEmployeService } from '../fonctionemploye.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { FonctionEmploye } from '../fonctionemploye';

@Component({
  selector: 'app-fonctionemploye-clone',
  templateUrl: './fonctionemploye-clone.component.html',
  styleUrls: ['./fonctionemploye-clone.component.scss']
})
export class FonctionEmployeCloneComponent extends BasePageComponent<FonctionEmploye> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public fonctionEmployeSrv: FonctionEmployeService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, fonctionEmployeSrv);
    this.pageData = {
      title: 'Clonage - FonctionEmploye',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'FonctionEmployes',
          route: '/'+this.orientation+'/fonctionemploye'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.fonctionEmployeSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: FonctionEmploye) {
    this.fonctionEmployeSrv.httpSrv.router.navigate([this.orientation,this.fonctionEmployeSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

