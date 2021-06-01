import { Employe } from './../employe/employe';
import { BamboAbstractService } from '../../../shared/services/bambo-abstract.service';
import { BamboHttpService } from './../../../shared/services/bambo-http.service';
import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { StructureFonction } from '../../parametrage/structurefonction/structurefonction';

@Injectable({
  providedIn: 'root'
})
export class FonctionEmployeService extends BamboAbstractService {

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService) {
    super(httpSrv, toastr);
    this.routePrefix = 'fonctionemploye/';
    this.resourceName = 'FONCTIONEMPLOYE';
  }

  findByEmploye(employe: Employe) {
    return this.httpSrv.get(this.routePrefix + employe.id + '/employe');
  }

  findLatest(employe: Employe) {
    return this.httpSrv.get(this.routePrefix + 'employe/' + employe.id + '/latest');
  }

  findByResponsabilite(responsabilite: StructureFonction) {
    return this.httpSrv.get(this.routePrefix + 'responsabilite/' + responsabilite.id);
  }

}
