import {Component, Input, OnDestroy, OnInit} from "@angular/core";
import {Router} from "@angular/router";
import {Store} from "@ngrx/store";
import {IAppState} from "src/app/interfaces/app-state";
import {BasePageComponent} from "src/app/pages/base-page/base-page.component";
import {MembreCommission} from "src/app/pages/gestionemploye/membrecommission/membrecommission";
import {MembreCommissionService} from "src/app/pages/gestionemploye/membrecommission/membrecommission.service";
import {Commission} from "src/app/pages/parametrage/commission/commission";
import { Employe } from "../../employe/employe";

@Component({selector: "app-membre-commission-employe", templateUrl: "./membre-commission-employe.component.html", styleUrls: ["./membre-commission-employe.component.scss"]})
export class MembreCommissionEmployeComponent
extends BasePageComponent<MembreCommission>
implements OnInit,
OnDestroy {
  @Input()commission: Commission;
  isShowable: boolean = false;

  constructor(store : Store<IAppState>, private membreCommissionSrv : MembreCommissionService, private router : Router) {
    super(store, membreCommissionSrv);
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findMembresOfCommission(this.commission);
  }

  /**
   * Permet d'avoir le route pour voir les infos de l'employé
   * @param employe employe
   * @returns route
   */
  employeRoute(employe : Employe): string[]{
    let url: string = this.router.url;
    return ["/" + url.split("/")[1] + "/employe/" + employe.id];
  }

  private findMembresOfCommission(commission : Commission) {
    this.membreCommissionSrv.findMembresOfCommission(commission).subscribe((data : any) => {
      this.isShowable = true;
      this.items = data;
    }, (err) => this.membreCommissionSrv.httpSrv.catchError(err));
  }
}
