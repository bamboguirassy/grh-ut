import { Component, ElementRef, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';

import { Store } from '@ngrx/store';

import { IAppState } from '../../interfaces/app-state';
import { BaseLayoutComponent } from '../base-layout/base-layout.component';
import { HttpService } from '../../services/http/http.service';
import { IOption } from '../../ui/interfaces/option';
import { Content } from '../../ui/interfaces/modal';
import { TCModalService } from '../../ui/services/modal/modal.service';
import * as SettingsActions from '../../store/actions/app-settings.actions';
import { Subscription } from 'rxjs';
import { IMenuItem } from 'src/app/interfaces/main-menu';
import { User } from 'src/app/pages/parametrage/user/user';
import { BamboAuthService } from 'src/app/shared/services/bambo-auth.service';

@Component({
  selector: 'vertical-layout',
  templateUrl: './vertical.component.html',
  styleUrls: [
    '../base-layout/base-layout.component.scss',
    './vertical.component.scss'
  ]
})
export class VerticalLayoutComponent extends BaseLayoutComponent implements OnInit {
  patientForm: FormGroup;
  gender: IOption[];
  currentAvatar: string | ArrayBuffer;
  defaultAvatar: string;

  subscription: Subscription;
  currentUser: User;
  menuItems: IMenuItem[] = [];

  constructor(
    store: Store<IAppState>,
    fb: FormBuilder,
    httpSv: HttpService,
    router: Router,
    elRef: ElementRef,
    private modal: TCModalService,
    public authSrv: BamboAuthService
  ) {
    super(store, fb, httpSv, router, elRef);

    this.gender = [
      {
        label: 'Male',
        value: 'male'
      },
      {
        label: 'Female',
        value: 'female'
      }
    ];
    this.defaultAvatar = 'assets/content/anonymous-400.jpg';
    this.currentAvatar = this.defaultAvatar;
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
    this.store.dispatch(new SettingsActions.Update({ layout: 'vertical' }));
  }

  // open modal window
  openModal<T>(body: Content<T>, header: Content<T> = null, footer: Content<T> = null, options: any = null) {
    this.initPatientForm();

    this.modal.open({
      body: body,
      header: header,
      footer: footer,
      options: options
    });
  }

  // close modal window
  closeModal() {
    this.modal.close();
    this.patientForm.reset();
    this.currentAvatar = this.defaultAvatar;
  }

  // upload new file
  onFileChanged(inputValue: any) {
    let file: File = inputValue.target.files[0];
    let reader: FileReader = new FileReader();

    reader.onloadend = () => {
      this.currentAvatar = reader.result;
    };

    reader.readAsDataURL(file);
  }

  // init form
  initPatientForm() {
    this.patientForm = this.fb.group({
      img: [],
      name: ['', Validators.required],
      number: ['', Validators.required],
      age: ['', Validators.required],
      gender: ['', Validators.required],
      address: ['', Validators.required]
    });
  }

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
  }
}
