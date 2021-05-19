import { Injectable } from '@angular/core';
import { BamboHttpService } from 'src/app/shared/services/bambo-http.service';
import { TypeEmploye } from '../parametrage/typeemploye/typeemploye';

@Injectable({
  providedIn: 'root'
})
export class DashboardService {

  routePrefix: string = "statistics/";

  constructor(
    public httpSrv: BamboHttpService,
  ) { }

  findStatsByType(typeEmployes: TypeEmploye[]) {
    return this.httpSrv.post(this.routePrefix + 'employe/by-type', { 'typeEmployes': typeEmployes.map(te => te.id) });
  }

  calculateStatsSuiviRecrutementGroupedByType() {
    return this.httpSrv.get(this.routePrefix  + 'employe/suivi-recrutement-type');
  }

  calculateRecrutementGroupedByGenres() {
    return this.httpSrv.get(this.routePrefix  + 'employe/suivi-recrutement-genre');
  }

  countByType() {
    return this.httpSrv.get(this.routePrefix + 'employe/count-by-type/');
  }

  countByProfession() {
    return this.httpSrv.get(this.routePrefix + 'employe/count-by-profession/');
  }
  
  countEmployeByGrade() {
    return this.httpSrv.get(this.routePrefix + 'employe/count-by-grade');
  }
}
