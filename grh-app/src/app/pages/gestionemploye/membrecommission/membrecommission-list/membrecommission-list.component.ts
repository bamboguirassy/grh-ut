import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy, Input } from '@angular/core';
import { Store } from '@ngrx/store';
import { MembreCommissionService } from '../membrecommission.service';
import { MembreCommission } from '../membrecommission';
import { Employe } from '../../employe/employe';
import { SETTINGS } from 'src/environments/settings';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-membrecommission-list',
  templateUrl: './membrecommission-list.component.html',
  styleUrls: ['./membrecommission-list.component.scss']
})
export class MembreCommissionListComponent implements OnInit, OnDestroy {

  @Input() employe: Employe;
  items:MembreCommission[]=[];
  secondViewBorder = 'warning';
  lightGradient = ['#fff', SETTINGS.topbarBg];
  selectedMembreCommission: MembreCommission;

  constructor(store: Store<IAppState>,
    public membreCommissionSrv: MembreCommissionService) {

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
  remove(membreCommission: MembreCommission) {
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
        this.membreCommissionSrv.remove(membreCommission)
          .subscribe(() => {
            Swal.close();
            this.membreCommissionSrv.toastr.success("Suppression reussie");
            this.findByEmploye();
          },err=>this.membreCommissionSrv.httpSrv.catchError(err));
        // For more information about handling dismissals please visit
        // https://sweetalert2.github.io/#handling-dismissals
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.close();
        this.membreCommissionSrv.toastr.warning("Suppression annulée !");
      }
    });
  }

  onCreate(item: MembreCommission) {
    this.findByEmploye();
  }

  onClose(){
    this.selectedMembreCommission = null;
  }
  findByEmploye() {
    this.membreCommissionSrv.findByEmploye(this.employe)
    .subscribe((data: any)=>{
      this.items = data;
            
    },err=>this.membreCommissionSrv.httpSrv.catchError(err));
  }

  setSelectedMembreCommission(element: MembreCommission){
    this.selectedMembreCommission = element;
  }
}
