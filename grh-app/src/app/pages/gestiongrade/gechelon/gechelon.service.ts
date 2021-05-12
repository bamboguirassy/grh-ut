import { BamboAbstractService } from '../../../shared/services/bambo-abstract.service';
import { BamboHttpService } from './../../../shared/services/bambo-http.service';
import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { first } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class GEchelonService extends BamboAbstractService {

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService) {
    super(httpSrv, toastr);
    this.routePrefix = 'gechelon/';
    this.resourceName = 'GECHELON';
  }
  
  findNonSuivant() {
    return this.httpSrv.get(this.routePrefix+'nosuivant/').pipe(first());
  }
}
