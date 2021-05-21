import { TypeEmploye } from './../typeemploye/typeemploye';
import { BamboAbstractService } from '../../../shared/services/bambo-abstract.service';
import { BamboHttpService } from './../../../shared/services/bambo-http.service';
import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';

@Injectable({
  providedIn: 'root'
})
export class SyndicatService extends BamboAbstractService {

  types: any[] = [
    { label: 'syndicat', value: 'syndicat' },
    { label: 'amicale', value: 'amicale' },
  ];

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService) {
    super(httpSrv, toastr);
    this.routePrefix = 'syndicat/';
    this.resourceName = 'SYNDICAT';
  }

  findByTypeEmploye(typeEmploye: TypeEmploye) {
    return this.httpSrv.get(this.routePrefix+typeEmploye.id+'/typeemploye');
  }
  
}
