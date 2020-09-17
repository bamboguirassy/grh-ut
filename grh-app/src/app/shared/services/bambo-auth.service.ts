import { IMenuItem } from './../../interfaces/main-menu';
import { Injectable } from '@angular/core';
import { BamboHttpService } from './bambo-http.service';
import { first } from 'rxjs/operators';
import { BehaviorSubject } from 'rxjs';
import { User } from '../../pages/parametrage/user/user';

@Injectable({
  providedIn: 'root'
})
export class BamboAuthService {

  private currentUserManager: BehaviorSubject<any> = new BehaviorSubject(null);
  public currentUserProvider = this.currentUserManager.asObservable();
  currentUser: User;
  menuItems: IMenuItem[];

  public localStorage = window.localStorage;

  constructor(public httpSrv: BamboHttpService) { }

  login(loginData: { username: string, password: string }) {
    this.httpSrv.post('login_check', loginData).
      pipe(first())
      .subscribe((data: any) => {
        this.httpSrv.tokenSrv.setToken(data.token);
        this.getCurrentUser()
          .then((user: User) => {
            this.httpSrv.router.navigate(['']);
          });
      }, error => {
        this.httpSrv.catchError(error);
      });
  }

  getCurrentUser() {
    return new Promise((resolve, reject) => {
      this.httpSrv.get('auth/current_user/').
        pipe(first()).subscribe((data: any) => {
          this.currentUser = data;
          this.currentUserManager.next(data);
          resolve(this.currentUser);
        }, error => {
          console.log(error);
          this.httpSrv.router.navigate(['public', 'sign-in']);
          resolve(false);
        });
    });
  }

  getRoles(): string[] {
    let roles: string[] = [];
    if (this.currentUser) {
      this.currentUser.groups.forEach(group => {
        roles = roles.concat(group.roles);
      });
    }
    return roles;
  }

  logout() {
    this.httpSrv.tokenSrv.removeToken();
    this.currentUserManager.next(null);
    this.currentUser = null;
    this.httpSrv.router.navigate(['public', 'sign-in']);
  }

  checkCloneAccess(entityName: string) {
    const role = 'ROLE_' + entityName + '_CLONE';
    return this.getRoles().includes(role);
  }

  checkEditAccess(entityName: string) {
    const role = 'ROLE_' + entityName + '_EDIT';
    return this.getRoles().includes(role);
  }

  checkCreateAccess(entityName: string) {
    const role = 'ROLE_' + entityName + '_CREATE';
    return this.getRoles().includes(role);
  }

  checkDeleteAccess(entityName: string) {
    const role = 'ROLE_' + entityName + '_DELETE';
    return this.getRoles().includes(role);
  }

  checkListAccess(entityName: string) {
    const role = 'ROLE_' + entityName.toUpperCase() + '_INDEX';
    return this.getRoles().includes(role);
  }

  checkShowAccess(entityName: string) {
    const role = 'ROLE_' + entityName + '_SHOW';
    return this.getRoles().includes(role);
  }


  getAuthorizedMenu(): IMenuItem[] {
    // define menu
    this.menuItems = [
      {
        "title": "Tableau de bord",
        "icon": {
          "class": "icofont-dashboard-web"
        },
        "routing": "default-dashboard",
        enabled: true
      },
      {
        "title": "Paramétrage",
        "icon": {
          "class": "icofont-tools-alt-2"
        },
        "sub": [
          {
            "title": "Groupe d'utilisateurs",
            "routing": "group",
            enabled: this.checkListAccess('group')
          },
          {
            "title": "Utilisateurs",
            "routing": "user",
            enabled: this.checkListAccess('user')
          },
          {
            "title": "Types Contrat",
            "routing": "typecontrat",
            enabled: this.checkListAccess('typecontrat')
          },
          {
            "title": "Types Document",
            "routing": "typedocument",
            enabled: this.checkListAccess('typedocument')
          },
          {
            "title": "Types Entité",
            "routing": "typeentite",
            enabled: this.checkListAccess('typeentite')
          },
          {
            "title": "Types Employé",
            "routing": "typeemploye",
            enabled: this.checkListAccess('typeemploye')
          },
          {
            "title": "Mutuelles de Santé",
            "routing": "mutuellesante",
            enabled: this.checkListAccess('mutuellesante')
          },
          {
            "title": "Caisses Sociales",
            "routing": "caissesociale",
            enabled: this.checkListAccess('caissesociale')
          },
          {
            "title": "Fonctions",
            "routing": "fonction",
            enabled: this.checkListAccess('fonction')
          },
          {
            "title": "Structures",
            "routing": "structure",
            enabled: this.checkListAccess('structure')
          },
          {
            title: "Syndicats",
            routing: "syndicat",
            enabled: this.checkListAccess('syndicat')
          },
        ],
        enabled: false
      },
      {
        title: "Gestion des grades",
        icon: {
          class: "icofont-graduate"
        },
        sub: [
          {
            title: "Grades",
            routing: "grade",
            enabled: this.checkListAccess('grade')
          }
        ],
        enabled: false
      },
      {
        title: "Gestion des employés",
        icon: {
          class: "icofont-people"
        },
        sub: [
          {
            title: "Employés",
            routing: "employe",
            enabled: this.checkListAccess('employe')
          }
        ],
        enabled: false
      }
    ];
    // parse and remove non authorized access
    this.menuItems.forEach(menuItem => {
      if (menuItem.sub?.length) {
        // authorized sub item
        let authSubs = menuItem.sub.filter(subItem => subItem.enabled)
        menuItem.sub = authSubs;
        menuItem.sub.length ? menuItem.enabled = true : menuItem.enabled = false;
      };
    });
    return this.menuItems.filter(menuItem => menuItem.enabled);
  }
}