import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { RangService } from '../rang.service';
import { Rang } from '../rang';

@Component({
  selector: 'app-rang-list',
  templateUrl: './rang-list.component.html',
  styleUrls: ['./rang-list.component.scss']
})
export class RangListComponent extends BasePageComponent<Rang> implements OnInit, OnDestroy {
  editEnabled: boolean;

  constructor(store: Store<IAppState>,
              public rangSrv: RangService) {
    super(store, rangSrv);

    this.pageData = {
      title: 'Liste des Rangs',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des rangs'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findAll();
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostDelete() {
    this.findAll();
  }

  handlePostLoad(){}

  
  enabledEdit(item) {
    item.editEnabled = true;
  }

  disableEdit(item) {
    item.editEnabled = false;
  }

  updateRang(rang) {
    this.rangSrv.update(rang)
      .subscribe(() => {
        rang.editEnabled = false;
      }, err => this.rangSrv.httpSrv.catchError(err));
  }

}
