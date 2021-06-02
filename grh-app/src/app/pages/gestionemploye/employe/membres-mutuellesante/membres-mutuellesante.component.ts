import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { MutuelleSante } from 'src/app/pages/parametrage/mutuellesante/mutuellesante';
import { Employe } from '../employe';
import { EmployeService } from '../employe.service';

@Component({
  selector: 'app-membres-mutuellesante',
  templateUrl: './membres-mutuellesante.component.html',
  styleUrls: ['./membres-mutuellesante.component.scss']
})
export class MembresMutuellesanteComponent extends BasePageComponent<Employe> implements OnInit, OnDestroy {

  titre='Liste des Membres ';

 @Input() membremutuelle:MutuelleSante;

  constructor(store: Store<IAppState>,
    public employeSrv: EmployeService,
    ) {
    super(store, employeSrv);
  }

  ngOnInit(): void {
    this.findEmployeByMutuelleSante();
  }


  findEmployeByMutuelleSante()
  {
    this.items = [];
    this.employeSrv.findEmployeByMutuelleSante(this.membremutuelle).subscribe((data:any) => {
      this.items = data;
    }, err => this.employeSrv.httpSrv.catchError(err));
    
  }

}
