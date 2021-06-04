import { BamboAbstractService } from '../../../shared/services/bambo-abstract.service';
import { BamboHttpService } from './../../../shared/services/bambo-http.service';
import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { MutuelleSante } from './mutuellesante';

@Injectable({
  providedIn: 'root'
})
export class MutuelleSanteService extends BamboAbstractService {

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService) {
    super(httpSrv, toastr);
    this.routePrefix = 'mutuellesante/';
    this.resourceName = 'MUTUELLESANTE';
  }

  uploadPhoto(mutuellesante: MutuelleSante, photo: any, fileName: any) {
    return this.httpSrv.put(this.routePrefix + 'upload-photo/' + mutuellesante.id, { photo, fileName });
  }
  
}
