import { Component, OnInit, OnDestroy } from '@angular/core';
import { MembreFamille } from '../membrefamille';
import { MembreFamilleService } from '../membrefamille.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-membrefamille-edit',
  templateUrl: './membrefamille-edit.component.html',
  styleUrls: ['./membrefamille-edit.component.scss']
})
export class MembreFamilleEditComponent extends BasePageComponent<MembreFamille> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public membreFamilleSrv: MembreFamilleService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, membreFamilleSrv);
    this.pageData = {
      title: 'Modification - MembreFamille',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'MembreFamilles',
          route: '/'+this.orientation+'/membrefamille'
        },
        {
          title: 'Modification'
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
  }

  prepareUpdate() {
  }

  handlePostUpdate() {
    this.location.back();
  }

}
