import { Employe } from './../employe/employe';
import { BamboAbstractService } from '../../../shared/services/bambo-abstract.service';
import { BamboHttpService } from './../../../shared/services/bambo-http.service';
import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';

@Injectable({
  providedIn: 'root'
})
export class DiplomeEmployeService extends BamboAbstractService {

  statutFormations: any[] = [
    { label: 'En cours', color: 'orange' },
    { label: 'Suspendue', color: '#E8273A' },
    { label: 'Terminée', color: 'green' }
  ];

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService) {
    super(httpSrv, toastr);
    this.routePrefix = 'diplomeemploye/';
    this.resourceName = 'DIPLOMEEMPLOYE';
  }

  findByEmploye(employe: Employe) {
    return this.httpSrv.get(this.routePrefix + employe.id + '/employe');
  }

}
