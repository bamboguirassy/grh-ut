import { TypeEmploye } from './../../parametrage/typeemploye/typeemploye';
import { BamboAbstractService } from '../../../shared/services/bambo-abstract.service';
import { BamboHttpService } from './../../../shared/services/bambo-http.service';
import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { BehaviorSubject } from 'rxjs';
import { Employe } from './employe';
import { CaisseSociale } from '../../parametrage/caissesociale/caissesociale';

@Injectable({
  providedIn: 'root'
})
export class EmployeService extends BamboAbstractService {

  private employesManager: BehaviorSubject<Employe[]> = new BehaviorSubject([]);
  public employesProvider = this.employesManager.asObservable();

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
  public motifSorties: any[] = [
    { label: 'Démission', value: 'Démission' },
    { label: 'Retraite', value: 'Retraite' },
    { label: 'Retraite Anticipé', value: 'Retraite Anticipé' },
    { label: 'Mis à pied', value: 'Mis à pied' },
    { label: 'Expiration Contrat', value: 'Expiration Contrat' },
  ]

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService) {
    super(httpSrv, toastr);
    this.routePrefix = 'employe/';
    this.resourceName = 'EMPLOYE';
  }

  findByTypeEmploye(typeEmploye: TypeEmploye) {
    return this.httpSrv.get(this.routePrefix + typeEmploye.id + '/typeemploye')
  }

  uploadPhoto(employe: Employe, photo: any, fileName: any) {
    return this.httpSrv.put(this.routePrefix + 'upload-photo/' + employe.id, { photo, fileName });
  }

  realtimeSearch(searchTerm: any) {
    return this.httpSrv.post(this.routePrefix+ 'realtime-search',{'searchTerm': searchTerm})
  }

  
  findAll(): any {
    this
      .httpSrv
      .get(this.routePrefix)
      .subscribe((employes: any) => {
        this.employesManager.next(employes);
      }, err => {
        this.httpSrv.handleError(err);
      })
  }

  findByCaisseSociale(caissesociale: CaisseSociale) {
    return this.httpSrv.get(this.routePrefix + "caisse-sociale/" + caissesociale.id);
  }



}
