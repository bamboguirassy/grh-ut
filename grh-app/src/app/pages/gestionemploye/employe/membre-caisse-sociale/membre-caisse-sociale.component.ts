import { Component, Input, OnInit } from '@angular/core';
import { first } from 'rxjs/operators';
import { CaisseSociale } from 'src/app/pages/parametrage/caissesociale/caissesociale';
import { Employe } from '../employe';
import { EmployeService } from '../employe.service';

@Component({
  selector: 'app-membre-caisse-sociale',
  templateUrl: './membre-caisse-sociale.component.html',
  styleUrls: ['./membre-caisse-sociale.component.scss']
})
export class MembreCaisseSocialeComponent implements OnInit {

  @Input() caisseSociale?: CaisseSociale;
  employes: Employe[] = [];

  constructor(
    public employeSrv: EmployeService
  ) { }

  ngOnInit(): void {
    console.log(this.caisseSociale);
    
  }

  findEmploye() {
    this.employeSrv.findByCaisseSociale(this.caisseSociale).pipe(first())
      .subscribe((data: any) => this.employes = data,
        error => this.employeSrv.httpSrv.catchError(error));
  }
}
