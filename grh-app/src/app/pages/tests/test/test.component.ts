import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { HttpService } from 'src/app/services/http/http.service';
import { BasePageComponent } from '../../base-page';

@Component({
  selector: 'app-test',
  templateUrl: './test.component.html',
  styleUrls: ['./test.component.scss']
})
export class TestComponent extends BasePageComponent<any> implements OnInit {

  constructor(store: Store<IAppState>,
    public httpSrv: HttpService,) {
    super(store, httpSrv);

    this.pageData = {
      title: 'Page de test des composants standalone',
      breadcrumbs: []
    };
    this.setLoaded();
  }

  ngOnInit(): void {
  }

}
