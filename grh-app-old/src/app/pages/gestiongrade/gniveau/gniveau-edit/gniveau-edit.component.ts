import { Component, OnInit, OnDestroy } from '@angular/core';
import { GNiveau } from '../gniveau';
import { GNiveauService } from '../gniveau.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-gniveau-edit',
  templateUrl: './gniveau-edit.component.html',
  styleUrls: ['./gniveau-edit.component.scss']
})
export class GNiveauEditComponent extends BasePageComponent<GNiveau> implements OnInit, OnDestroy {

niveaux:GNiveau[]=[];
selectedNiveauId:any;


  constructor(store: Store<IAppState>,
              public gNiveauSrv: GNiveauService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, gNiveauSrv);
    this.pageData = {
      title: 'Modification - niveau',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des niveaux',
          route: '/'+this.orientation+'/gniveau'
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
    this.findNiveaux();
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.selectedNiveauId = this.entity.suivant?.id;
    this.findNiveaux();
  }

  prepareUpdate() {
    this.entity.suivant=this.selectedNiveauId;
    
  }

  handlePostUpdate() {
    this.location.back();
  }

  
  findNiveaux(){
    this.gNiveauSrv.findNonSuivant()
    .subscribe((data:any)=>{
      this.niveaux=data;
      if(this.entity?.suivant)
      {
        this.niveaux.unshift(this.entity.suivant);
      }
     
    },error => this.gNiveauSrv.httpSrv.catchError(error))


  }

}
