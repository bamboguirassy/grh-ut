import { BamboAbstractService } from '../../../shared/services/bambo-abstract.service';
import { BamboHttpService } from './../../../shared/services/bambo-http.service';
import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { Structure } from '../structure/structure';

@Injectable({
  providedIn: 'root'
})
export class RangService extends BamboAbstractService {

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService) {
    super(httpSrv, toastr);
    this.routePrefix = 'rang/';
    this.resourceName = 'RANG';
  }

  findNotBindedByStructure(structure: Structure) {
    return this.httpSrv.get(this.routePrefix + 'not-binded/' + structure.id + '/structure');
  }
  
}
