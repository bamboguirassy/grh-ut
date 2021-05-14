import { Component, OnInit, OnDestroy } from '@angular/core';
import { Structure } from '../structure';
import { StructureService } from '../structure.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';
import { TypeEntite } from '../../typeentite/typeentite';
import { TypeEntiteService } from '../../typeentite/typeentite.service';

@Component({
  selector: 'app-structure-edit',
  templateUrl: './structure-edit.component.html',
  styleUrls: ['./structure-edit.component.scss']
})
export class StructureEditComponent extends BasePageComponent<Structure> implements OnInit, OnDestroy {

  
  typeEntites: TypeEntite[] = [];
  structureParentes: Structure[] = [];
  selectedStructureParenteId: any;
  selectedTypeEntiteId: any;
  
  constructor(store: Store<IAppState>,
              public structureSrv: StructureService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location,
              public typeEntiteSrv: TypeEntiteService) {
    super(store, structureSrv);
    this.pageData = {
      title: 'Modification - Structure',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des structures',
          route: '/'+this.orientation+'/structure'
        },
        {
          title: 'Modification'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findEntity(this.activatedRoute.snapshot.params.id);
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.selectedTypeEntiteId = this.entity.typeEntite?.id;
    this.selectedStructureParenteId = this.entity?.structureParente?.id;
    this.findTypeEntites();
    this.findStructureParentes();
  }

  findTypeEntites() {
    this.typeEntiteSrv.findAll()
    .subscribe((data: any)=>{
      this.typeEntites = data;
    })
  }

  findStructureParentes() {
    this.structureSrv.findAll()
    .subscribe((data: any)=>{
      this.structureParentes = data;
    })
  }

  prepareUpdate() {
    if(this.selectedStructureParenteId) {
      this.entity.structureParente = this.selectedStructureParenteId;
    }
    this.entity.typeEntite = this.selectedTypeEntiteId;
  }

  handlePostUpdate() {
    this.location.back();
  }

}
