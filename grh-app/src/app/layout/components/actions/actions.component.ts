import { Component, EventEmitter, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { User } from 'src/app/pages/parametrage/user/user';
import { BamboAuthService } from 'src/app/shared/services/bambo-auth.service';

import { HttpService } from '../../../services/http/http.service';

@Component({
  selector: 'actions',
  templateUrl: './actions.component.html',
  styleUrls: ['./actions.component.scss']
})
export class ActionsComponent implements OnInit {
  notifications: any[];
  messages: any[];
  files: any[];
  closeDropdown: EventEmitter<boolean>;
  @Input() layout: string;
  currentUser: User;
  subscription: Subscription;

  constructor(
    private httpSv: HttpService,
    private router: Router,
    public authSrv: BamboAuthService
  ) {
    this.notifications = [];
    this.messages = [];
    this.files = [];
    this.closeDropdown = new EventEmitter<boolean>();
    this.layout = 'vertical';

    this.subscription = authSrv.currentUserProvider.subscribe((data) => {
      this.currentUser = data;
    });
  }

  ngOnDestroy(): void {
   this.subscription.unsubscribe();
  }
  

  ngOnInit() {
    //this.getData('assets/data/navbar-notifications.json', 'notifications');
    //this.getData('assets/data/navbar-messages.json', 'messages');
  }

  getData(url: string, dataName: string) {
    this.httpSv.getData(url).subscribe(
      data => {
        this[dataName] = data;
      },
      err => {
        console.log(err);
      }
    );
  }

  onCloseDropdown() {
    this.closeDropdown.emit(true);
  }

  goTo(event: Event, link: string, layout: string = '') {
    event.preventDefault();

    this.onCloseDropdown();

    setTimeout(() => {
      this.router.navigate([layout ? layout : this.layout, link]);
    });
  }

  logout(event:Event) {
    event.preventDefault();
    this.onCloseDropdown();
    setTimeout(() => {
      this.authSrv.logout();
    });
  }
}
