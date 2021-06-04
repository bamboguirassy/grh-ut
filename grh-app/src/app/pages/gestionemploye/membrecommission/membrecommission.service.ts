import { BamboAbstractService } from '../../../shared/services/bambo-abstract.service';
import { BamboHttpService } from './../../../shared/services/bambo-http.service';
import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { Employe } from '../employe/employe';
import { Commission } from '../../parametrage/commission/commission';
import { EmployeService } from '../employe/employe.service';

@Injectable({
  providedIn: 'root'
})
export class MembreCommissionService extends BamboAbstractService {

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService, private employe: EmployeService) {
    super(httpSrv, toastr);
    this.routePrefix = 'membrecommission/';
    this.resourceName = 'MEMBRECOMMISSION';
  }

  findByEmploye(employe: Employe) {
    return this.httpSrv.get(this.routePrefix + employe.id + '/employe');
  }

  findMembresOfCommission(commission: Commission){
    return this.httpSrv.get(this.routePrefix + commission.id + '/membres-commission');
  }

  searchEmploye(data: any){
    return this.employe.realtimeSearch(data);
  }

  toastError(message: string){
    this.toastr.error(message);
  }

  toastSuccess(message: string){
    this.toastr.success(message);
  }
  
}
