import { BamboAbstractService } from '../../../shared/services/bambo-abstract.service';
import { BamboHttpService } from './../../../shared/services/bambo-http.service';
import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { GClasse } from '../gclasse/gclasse';
import { first } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class GradeService extends BamboAbstractService {

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService) {
    super(httpSrv, toastr);
    this.routePrefix = 'grade/';
    this.resourceName = 'GRADE';
  }

  createBatch(item: any) {
    return this.httpSrv.post(this.routePrefix + 'create-batch/' + item.niveau.id, item);
  }

  mapByClasse(classe: GClasse) {
    return this.httpSrv.get(this.routePrefix + 'map/' + classe.id + '/classe');
  }

}
