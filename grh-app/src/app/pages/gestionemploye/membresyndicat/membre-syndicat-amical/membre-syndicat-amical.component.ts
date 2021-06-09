import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Syndicat } from 'src/app/pages/parametrage/syndicat/syndicat';
import { Employe } from '../../employe/employe';
import { EmployeService } from '../../employe/employe.service';
import { MembreSyndicat } from '../membresyndicat';
import { MembreSyndicatService } from '../membresyndicat.service';

@Component({
  selector: 'app-membre-syndicat-amical',
  templateUrl: './membre-syndicat-amical.component.html',
  styleUrls: ['./membre-syndicat-amical.component.scss']
})
export class MembreSyndicatAmicalComponent extends BasePageComponent<Employe> implements OnInit, OnDestroy {

  @Input() membresyndicat:Syndicat;
  @Input() orientation='';
  employes: MembreSyndicat[];
  constructor(store: Store<IAppState>,
    public membresyndicatSrv: MembreSyndicatService,
    public EmployeSrv:EmployeService,

  ) {
    super(store,membresyndicatSrv);
  }

  ngOnInit(): void {
    this.findBySyndicat();
  }

  findBySyndicat()
  {

    
    this.membresyndicatSrv.findBySyndicat(this.membresyndicat).subscribe((data:any) => {
      this.employes = data;
    }, err => this.membresyndicatSrv.httpSrv.catchError(err));
    
  }



}
