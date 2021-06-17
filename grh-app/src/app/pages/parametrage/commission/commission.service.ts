import { BamboAbstractService } from '../../../shared/services/bambo-abstract.service';
import { BamboHttpService } from './../../../shared/services/bambo-http.service';
import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';

@Injectable({
  providedIn: 'root'
})
export class CommissionService extends BamboAbstractService {

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService) {
    super(httpSrv, toastr);
    this.routePrefix = 'commission/';
    this.resourceName = 'COMMISSION';
  }

  membresCommission(){
    return this.httpSrv.get("membrecommission").subscribe({
      next: data => {
      },
      error: errors => {
        this.httpSrv.catchError(errors);
      },
    })
  }

}
