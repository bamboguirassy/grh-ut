import { TypeEmploye } from './../../parametrage/typeemploye/typeemploye';
import { BamboAbstractService } from '../../../shared/services/bambo-abstract.service';
import { BamboHttpService } from './../../../shared/services/bambo-http.service';
import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';

@Injectable({
  providedIn: 'root'
})
export class EmployeService extends BamboAbstractService {

  public situationMatrimoniales: any[] = [
    { label: 'Célibataire', value: 'Célibataire' },
    { label: 'Marié(e)', value: 'Marié(e)' },
    { label: 'Divorcé(e)', value: 'Divorcé(e)' },
    { label: 'Veuf(ve)', value: 'Veuf(ve)' }
  ];

  public genres: any[] = [
    { label: 'Masculin', value: 'Masculin' },
    { label: 'Féminin', value: 'Féminin' },
  ];

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService) {
    super(httpSrv, toastr);
    this.routePrefix = 'employe/';
    this.resourceName = 'EMPLOYE';
  }

  findByTypeEmploye(typeEmploye: TypeEmploye) {
    return this.httpSrv.get(this.routePrefix + typeEmploye.id + '/typeemploye')
  }

  countByType() {
    return this.httpSrv.get(this.routePrefix + 'statistics/count-by-type/');
  }
  uploadPhoto(photo: any, fileName: any) {
    return this.httpSrv.put(this.routePrefix+ 'change_image_employe', {photo, fileName});
}
  

  findStatsByType(typeEmployes: TypeEmploye[]) {
    return this.httpSrv.post(this.routePrefix + 'statistics/by-type', { 'typeEmployes': typeEmployes.map(te => te.id) });
  }

}
