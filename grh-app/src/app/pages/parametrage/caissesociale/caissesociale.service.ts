import { BamboAbstractService } from '../../../shared/services/bambo-abstract.service';
import { BamboHttpService } from './../../../shared/services/bambo-http.service';
import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { CaisseSociale } from './caissesociale';

@Injectable({
  providedIn: 'root'
})
export class CaisseSocialeService extends BamboAbstractService {

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService) {
    super(httpSrv, toastr);
    this.routePrefix = 'caissesociale/';
    this.resourceName = 'CAISSESOCIALE';
  }

  uploadPhoto(caisseSociale: CaisseSociale, photo: any, fileName: any) {
    return this.httpSrv.put(this.routePrefix + 'upload-photo-caisseSociale/' + caisseSociale.id, { photo, fileName });
  }

  findWithAtLeastOneEmploye() {
    return this.httpSrv.get(this.routePrefix + 'with-at-least-one-employe');
  }
  
}
