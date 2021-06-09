import { Employe } from './../employe/employe';
import { BamboAbstractService } from '../../../shared/services/bambo-abstract.service';
import { BamboHttpService } from './../../../shared/services/bambo-http.service';
import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { Syndicat } from '../../parametrage/syndicat/syndicat';

@Injectable({
  providedIn: 'root'
})
export class MembreSyndicatService extends BamboAbstractService {

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService) {
    super(httpSrv, toastr);
    this.routePrefix = 'membresyndicat/';
    this.resourceName = 'MEMBRESYNDICAT';
  }

  findByEmploye(employe: Employe) {
    return this.httpSrv.get(this.routePrefix+employe.id+'/employe')
  }
  


  findBySyndicat(membresyndicat:Syndicat)
  {
    return this.httpSrv.get(this.routePrefix +membresyndicat.id+'/membre-syndicat');
  }

}
