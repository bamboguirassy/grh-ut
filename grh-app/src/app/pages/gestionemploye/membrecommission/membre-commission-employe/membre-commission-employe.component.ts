import {Component, Input, OnDestroy, OnInit} from "@angular/core";
import {Store} from "@ngrx/store";
import {IAppState} from "src/app/interfaces/app-state";
import {BasePageComponent} from "src/app/pages/base-page/base-page.component";
import {MembreCommission} from "src/app/pages/gestionemploye/membrecommission/membrecommission";
import {MembreCommissionService} from "src/app/pages/gestionemploye/membrecommission/membrecommission.service";
import { Commission } from "src/app/pages/parametrage/commission/commission";

@Component({selector: "app-membre-commission-employe", templateUrl: "./membre-commission-employe.component.html", styleUrls: ["./membre-commission-employe.component.scss"]})
export class MembreCommissionEmployeComponent
extends BasePageComponent<MembreCommission>
implements OnInit,
OnDestroy {
  @Input() commission: Commission;
  isShowable: boolean = false;

  constructor(store : Store<IAppState>,private membreCommissionSrv : MembreCommissionService) {
    super(store, membreCommissionSrv);
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findMembresOfCommission(this.commission);
  }

  private findMembresOfCommission(commission: Commission){
    this.membreCommissionSrv.findMembresOfCommission(commission)
    .subscribe((data: any)=>{
      this.isShowable = true;
      this.items = data;
    },err=>this.membreCommissionSrv.httpSrv.catchError(err));
  }

}
