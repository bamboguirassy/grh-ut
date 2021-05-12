import { Employe } from './../employe/employe';
import { BamboAbstractService } from '../../../shared/services/bambo-abstract.service';
import { BamboHttpService } from './../../../shared/services/bambo-http.service';
import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';

@Injectable({
  providedIn: 'root'
})
export class MembreFamilleService extends BamboAbstractService {

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService) {
    super(httpSrv, toastr);
    this.routePrefix = 'membrefamille/';
    this.resourceName = 'MEMBREFAMILLE';
  }

  findByEmploye(employe: Employe) {
    return this.httpSrv.get(this.routePrefix+employe.id+'/employe');
  }
  
}
