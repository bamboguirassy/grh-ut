import { BamboAbstractService } from '../../../shared/services/bambo-abstract.service';
import { BamboHttpService } from './../../../shared/services/bambo-http.service';
import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';

@Injectable({
  providedIn: 'root'
})
export class StructureService extends BamboAbstractService {

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService) {
    super(httpSrv, toastr);
    this.routePrefix = 'structure/';
    this.resourceName = 'STRUCTURE';
  }

  findWithAtLeastOneEmploye() {
    return this.httpSrv.get(this.routePrefix + 'with-at-least-one-employe');
  }

  findOrganigramme() {
    return this.httpSrv.get(this.routePrefix + 'find-organigramme');
  }
  
}
