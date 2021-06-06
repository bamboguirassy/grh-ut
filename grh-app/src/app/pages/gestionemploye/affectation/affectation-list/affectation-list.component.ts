import { SETTINGS } from './../../../../../environments/settings';
import { Employe } from './../../employe/employe';
import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy, Input } from '@angular/core';
import { Store } from '@ngrx/store';
import { AffectationService } from '../affectation.service';
import { Affectation } from '../affectation';
import Swal from 'sweetalert2';
import { AngularChart } from 'ng2-charts';

@Component({
  selector: 'app-affectation-list',
  templateUrl: './affectation-list.component.html',
  styleUrls: ['./affectation-list.component.scss']
})
export class AffectationListComponent implements OnInit, OnDestroy {
  selectedAffectation: Affectation;
  @Input() employe: Employe;
  @Input() displayTimeline: boolean = true;
  items: Affectation[]=[];
  secondViewBorder = 'warning';
  lightGradient = ['#fff', SETTINGS.topbarBg];



  constructor(store: Store<IAppState>,
              public affectationSrv: AffectationService) {
               
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
  
  remove(affectation: Affectation) {
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
        this.affectationSrv.remove(affectation)
          .subscribe(() => {
            Swal.close();
            this.affectationSrv.toastr.success("Suppression reussie");
            this.findByEmploye();
          },err=>this.affectationSrv.httpSrv.catchError(err));
        // For more information about handling dismissals please visit
        // https://sweetalert2.github.io/#handling-dismissals
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.close();
        this.affectationSrv.toastr.warning("Suppression annulée !");
      }
    });
  }
  
  onCreate(item: Affectation) {
   this.findByEmploye();
  }

  onClose(){
    this.selectedAffectation = null;
  }

  findByEmploye() {
    this.affectationSrv.findByEmploye(this.employe)
    .subscribe((data: any)=>{
      this.items = data;        
    },err=>this.affectationSrv.httpSrv.catchError(err));
  }

  setSelectedAffectation(element: Affectation){
    this.selectedAffectation = element;
  }
}
  
