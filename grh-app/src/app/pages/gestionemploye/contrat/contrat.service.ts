import { BamboAbstractService } from '../../../shared/services/bambo-abstract.service';
import { BamboHttpService } from './../../../shared/services/bambo-http.service';
import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { Employe } from '../employe/employe';

@Injectable({
  providedIn: 'root'
})
export class ContratService extends BamboAbstractService {

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService) {
    super(httpSrv, toastr);
    this.routePrefix = 'contrat/';
    this.resourceName = 'CONTRAT';
  }
  
  findByEmploye(employe: Employe) {
    return this.httpSrv.get(this.routePrefix + employe.id + '/employe');
  }

  findEnExpiration() {
    return this.httpSrv.get(this.routePrefix + 'contrat-en-expirartion');
  }

}
