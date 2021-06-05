import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy, Input } from '@angular/core';
import { Store } from '@ngrx/store';
import { ContratService } from '../contrat.service';
import { Contrat } from '../contrat';
import { Employe } from '../../employe/employe';
import Swal from 'sweetalert2';
import { SETTINGS } from 'src/environments/settings';

@Component({
  selector: 'app-contrat-list',
  templateUrl: './contrat-list.component.html',
  styleUrls: ['./contrat-list.component.scss']
})
export class ContratListComponent implements OnInit, OnDestroy {
  @Input() employe: Employe;
  @Input() displayTimeline: boolean = true; 
  items:Contrat[]=[];
  secondViewBorder = 'warning';
  lightGradient = ['#fff', SETTINGS.topbarBg];
  selectedContrat: Contrat;


  constructor(store: Store<IAppState>,
    public contratSrv: ContratService) {

  }

  ngOnInit(): void {
    this.findByEmploye();
  }

  ngOnDestroy() {
  }

  handlePostDelete() {
    this.findByEmploye();
  }

  handlePostLoad() { }

  remove(contrat: Contrat) {
    Swal.fire({
      title: 'Êtes-vous sûr ?',
      text: 'Cette opération est irreversible !',
      icon: 'error',
      showCancelButton: true,
      confirmButtonText: 'Oui, supprimer',
      cancelButtonText: 'Non, annuler',
      confirmButtonColor: '#d33'
    }).then((result) => {
      if (result.value) {
        this.contratSrv.remove(contrat)
          .subscribe(() => {
            Swal.close();
            this.contratSrv.toastr.success("Suppression reussie");
            this.findByEmploye();
          },err=>this.contratSrv.httpSrv.catchError(err));
        // For more information about handling dismissals please visit
        // https://sweetalert2.github.io/#handling-dismissals
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.close();
        this.contratSrv.toastr.warning("Suppression annulée !");
      }
    });
  }
  
  onCreate(item: Contrat) {
  this.findByEmploye();

  }

  onClose(){
    this.selectedContrat = null;
  }

  findByEmploye() {
    this.contratSrv.findByEmploye(this.employe)
    .subscribe((data: any)=>{
      this.items = data;
      console.log(this.items);
    },err=>this.contratSrv.httpSrv.catchError(err));
  }

  setSelectedContrat(element: Contrat){
    this.selectedContrat = element;
  }

}
