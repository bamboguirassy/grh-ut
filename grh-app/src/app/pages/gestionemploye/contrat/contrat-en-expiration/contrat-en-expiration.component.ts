import { Component, OnInit, Input, OnDestroy } from '@angular/core';
import { SETTINGS } from 'src/environments/settings';
import { IAppState } from 'src/app/interfaces/app-state';
import { Store } from '@ngrx/store';
import Swal from 'sweetalert2';
import { ContratService } from '../contrat.service';
import { Contrat } from '../contrat';
import { BasePageComponent } from 'src/app/pages/base-page';

@Component({
  selector: 'app-contrat-en-expiration',
  templateUrl: './contrat-en-expiration.component.html',
  styleUrls: ['./contrat-en-expiration.component.scss']
})
export class ContratEnExpirationComponent extends BasePageComponent<Contrat>  implements  OnInit, OnDestroy {

  items:Contrat[]=[];
  secondViewBorder = 'warning';
  lightGradient = ['#fff', SETTINGS.topbarBg];
  selectedContrat: Contrat;


  constructor(store: Store<IAppState>,
    public contratSrv: ContratService) {
      super(store, contratSrv);
      this.setLoaded(); 
      this.pageData = {
        title: 'Liste des contrats bientôt expirés',
        breadcrumbs: [
          {
            title: 'Accueil',
            route: ''
          },
          {
            title: 'Liste des contrats'
          }
        ]
      };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findAll();
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostDelete() {
  }

  handlePostLoad() { }
 
  
  
  onClose(){
    this.selectedContrat = null;
  }

  findAll() {
    this.contratSrv.findAll()
    .subscribe((data: any)=>{
      this.items = data;          
    },err=>this.contratSrv.httpSrv.catchError(err));
  }

 

}
