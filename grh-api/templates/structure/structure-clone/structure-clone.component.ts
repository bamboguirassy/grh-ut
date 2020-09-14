import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { StructureService } from '../structure.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { Structure } from '../structure';

@Component({
  selector: 'app-structure-clone',
  templateUrl: './structure-clone.component.html',
  styleUrls: ['./structure-clone.component.scss']
})
export class StructureCloneComponent extends BasePageComponent<Structure> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public structureSrv: StructureService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, structureSrv);
    this.pageData = {
      title: 'Clonage - Structure',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Structures',
          route: '/'+this.orientation+'/structure'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.structureSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: Structure) {
    this.structureSrv.httpSrv.router.navigate([this.orientation,this.structureSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

