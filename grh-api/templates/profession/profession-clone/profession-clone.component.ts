import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { ProfessionService } from '../profession.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { Profession } from '../profession';

@Component({
  selector: 'app-profession-clone',
  templateUrl: './profession-clone.component.html',
  styleUrls: ['./profession-clone.component.scss']
})
export class ProfessionCloneComponent extends BasePageComponent<Profession> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public professionSrv: ProfessionService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, professionSrv);
    this.pageData = {
      title: 'Clonage - Profession',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Professions',
          route: '/'+this.orientation+'/profession'
        },
        {
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.professionSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: Profession) {
    this.professionSrv.httpSrv.router.navigate([this.orientation,this.professionSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

