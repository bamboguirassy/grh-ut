import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { TypeEmployeService } from '../typeemploye.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { TypeEmploye } from '../typeemploye';

@Component({
  selector: 'app-typeemploye-clone',
  templateUrl: './typeemploye-clone.component.html',
  styleUrls: ['./typeemploye-clone.component.scss']
})
export class TypeEmployeCloneComponent extends BasePageComponent<TypeEmploye> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public typeEmployeSrv: TypeEmployeService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, typeEmployeSrv);
    this.pageData = {
      title: 'Clonage - TypeEmploye',
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
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.typeEmployeSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: TypeEmploye) {
    this.typeEmployeSrv.httpSrv.router.navigate([this.orientation,this.typeEmployeSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

