import { TypeEmploye } from 'src/app/pages/parametrage/typeemploye/typeemploye';
import { Injectable } from '@angular/core';
import { BamboHttpService } from 'src/app/shared/services/bambo-http.service';
//import { TypeEmploye } from '../parametrage/typeemploye/typeemploye';

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

  countEmployeByEntreeSortie() {
    return this.httpSrv.get(this.routePrefix  + 'employe/count-by-entree-sortie');
  }

  countDemissionEmployeByProfessionAnnee() {
    return this.httpSrv.get(this.routePrefix  + 'employe/count-demission-profession-annee');
  }

  countDemissionEmployeByStructureAnnee() {
    return this.httpSrv.get(this.routePrefix  + 'employe/count-demission-structure-annee');
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
  countEmployeByStructure() {
    return this.httpSrv.get(this.routePrefix + 'employe/count-by-structure');
  }
  countEmployeByTypeEmploye() {
    return this.httpSrv.get(this.routePrefix + 'employe/count-by-typeemploye');
  }

  countEmployeByDateRange(dateDebut: any, dateFin: any) {
      return this.httpSrv.post(this.routePrefix + 'employe/count-by-daterange/', {'dateDebut':dateDebut, 'dateFin':dateFin});
  }

  countEmployeByPeriod(date: any) {
      return this.httpSrv.post(this.routePrefix + 'employe/count-by-period', {'date':date});
  }

  countEmployeByTypeContrat(){
    return this.httpSrv.get(this.routePrefix + 'employe/count-by-typecontrat');

  }
  countEmployeByTypeContratActif(){
    return this.httpSrv.get(this.routePrefix + 'employe/count-by-typecontrat-actif');

  }
  getSeniorityStats() {
    return this.httpSrv.get(this.routePrefix + 'employe/count-employe-by-seniority');
  }

  countEmployeByDiplome() {
    return this.httpSrv.get(this.routePrefix + 'employe/count-by-diplome');
  }

  countAgeByTypeEmploye(typeEmploye: TypeEmploye) {
    return this.httpSrv.get(this.routePrefix + 'employe/count-age-by-type-employe/'+typeEmploye.id);
  }
  countPersByGradeGroupByGenre(){
    return this.httpSrv.get(this.routePrefix + 'employe/count-pers-by-grade');
  }


}
