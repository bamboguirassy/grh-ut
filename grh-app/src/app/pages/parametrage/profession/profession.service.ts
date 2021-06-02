import { first } from 'rxjs/operators';
import { Profession } from './profession';
import { Affectation } from './../../gestionemploye/affectation/affectation';
import { BamboAbstractService } from '../../../shared/services/bambo-abstract.service';
import { BamboHttpService } from './../../../shared/services/bambo-http.service';
import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';

@Injectable({
  providedIn: 'root'
})
export class ProfessionService extends BamboAbstractService {

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService) {
    super(httpSrv, toastr);
    this.routePrefix = 'profession/';
    this.resourceName = 'PROFESSION';
  }


  forceDelete(profession: Profession) {
    return this.httpSrv.forceDelete(this.routePrefix + profession.id +"/forceDelete").pipe(first());
  }
  
}
