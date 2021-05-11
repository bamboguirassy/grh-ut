import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { StructureFonctionService } from '../structurefonction.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { StructureFonction } from '../structurefonction';

@Component({
  selector: 'app-structurefonction-clone',
  templateUrl: './structurefonction-clone.component.html',
  styleUrls: ['./structurefonction-clone.component.scss']
})
export class StructureFonctionCloneComponent extends BasePageComponent<StructureFonction> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public structureFonctionSrv: StructureFonctionService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, structureFonctionSrv);
    this.pageData = {
      title: 'Clonage - StructureFonction',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'StructureFonctions',
          route: '/'+this.orientation+'/structurefonction'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.structureFonctionSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: StructureFonction) {
    this.structureFonctionSrv.httpSrv.router.navigate([this.orientation,this.structureFonctionSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

