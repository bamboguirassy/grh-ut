import { BamboAbstractService } from '../../../shared/services/bambo-abstract.service';
import { BamboHttpService } from './../../../shared/services/bambo-http.service';
import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { Employe } from '../employe/employe';

@Injectable({
  providedIn: 'root'
})
export class MembreCommissionService extends BamboAbstractService {

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService) {
    super(httpSrv, toastr);
    this.routePrefix = 'membrecommission/';
    this.resourceName = 'MEMBRECOMMISSION';
  }
  findByEmploye(employe: Employe) {
    return this.httpSrv.get(this.routePrefix + employe.id + '/employe');
  }
  
}
