import { BamboAbstractService } from '../../../shared/services/bambo-abstract.service';
import { BamboHttpService } from './../../../shared/services/bambo-http.service';
import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { StructureFonction } from './structurefonction';
import { Structure } from '../structure/structure';

@Injectable({
  providedIn: 'root'
})
export class StructureFonctionService extends BamboAbstractService {

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService) {
    super(httpSrv, toastr);
    this.routePrefix = 'structurefonction/';
    this.resourceName = 'STRUCTUREFONCTION';
  }

  createMultiple(structureFonctions: StructureFonction[], structure: Structure) {
    return this.httpSrv.post(this.routePrefix + 'create-multiple/' + structure.id, { structureFonctions });
  }

  findByStructure(structure: Structure) {
    return this.httpSrv.get(this.routePrefix + 'structure/' + structure.id);
  }

}
