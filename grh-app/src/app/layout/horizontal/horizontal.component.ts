import { Component, ElementRef, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';

import { Store } from '@ngrx/store';

import { HttpService } from '../../services/http/http.service';
import { IAppState } from '../../interfaces/app-state';
import { BaseLayoutComponent } from '../base-layout/base-layout.component';
import * as SettingsActions from '../../store/actions/app-settings.actions';
import { BamboAuthService } from 'src/app/shared/services/bambo-auth.service';
import { Subscription } from 'rxjs';
import { IMenuItem } from 'src/app/interfaces/main-menu';
import { User } from 'src/app/pages/parametrage/user/user';

@Component({
  selector: 'horizontal-layout',
  templateUrl: './horizontal.component.html',
  styleUrls: [
    '../base-layout/base-layout.component.scss',
    './horizontal.component.scss'
  ]
})
export class HorizontalLayoutComponent extends BaseLayoutComponent implements OnInit {
  
  subscription: Subscription;
  currentUser: User;
  menuItems: IMenuItem[] = [];
  
  constructor(
    store: Store<IAppState>,
    fb: FormBuilder,
    httpSv: HttpService,
    router: Router,
    elRef: ElementRef,
    public authSrv: BamboAuthService
  ) {
    super(store, fb, httpSv, router, elRef);
  }

  ngOnInit() {
    super.ngOnInit();
    this.subscription = this.authSrv
      .currentUserProvider.subscribe((data: any) => {
        this.currentUser = data;
        if (this.currentUser) {
          this.menuItems = this.authSrv.getAuthorizedMenu();
          this.getItemsRouters(this.authSrv.getAuthorizedMenu());
        } else {
          this.menuItems = [];
        }
      });
    this.store.dispatch(new SettingsActions.Update({ layout: 'horizontal' }));
  }

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
  }
}
