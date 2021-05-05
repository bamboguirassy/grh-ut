import { Component, OnInit, OnDestroy } from '@angular/core';
import { User } from '../user';
import { UserService } from '../user.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';
import { Group } from '../../group/group';
import { finalize } from 'rxjs/operators';
import { GroupService } from '../../group/group.service';

@Component({
  selector: 'app-user-edit',
  templateUrl: './user-edit.component.html',
  styleUrls: ['./user-edit.component.scss']
})
export class UserEditComponent extends BasePageComponent<User> implements OnInit, OnDestroy {
  groups: Group[] = []
  fetching = false;
  selectedGroupId: any;
  constructor(store: Store<IAppState>,
              public userSrv: UserService,
              public groupSrv: GroupService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, userSrv);
    this.pageData = {
      title: 'Modification - Utilisateur',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des utilisateurs',
          route: '/user'
        },
        {
          title: 'Modification de User'
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
    this.selectedGroupId = this.entity.groups?.map(group=>group.id)
    this.fetchGroups();
  }
  fetchGroups() {

    if (!this.groups.length) {
      this.fetching = true;
      this.groupSrv.findAll().pipe(
        finalize(() => this.fetching = false)
      ).subscribe((groups: any) => {
        this.groups = groups;
      }, error => {
        this.groupSrv.httpSrv.catchError(error);
      });
    }
    
  }

  prepareUpdate() {
    this.entity.groups = this.selectedGroupId;
   
  }

  handlePostUpdate() {
    this.location.back();
  }
  

}