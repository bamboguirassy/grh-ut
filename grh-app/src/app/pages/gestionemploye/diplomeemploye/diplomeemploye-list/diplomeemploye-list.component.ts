import { SETTINGS } from './../../../../../environments/settings';
import { Employe } from './../../employe/employe';
import { Component, OnInit, OnDestroy, Input } from '@angular/core';
import { DiplomeEmployeService } from '../diplomeemploye.service';
import { DiplomeEmploye } from '../diplomeemploye';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-diplomeemploye-list',
  templateUrl: './diplomeemploye-list.component.html',
  styleUrls: ['./diplomeemploye-list.component.scss']
})
export class DiplomeEmployeListComponent implements OnInit {
  @Input() employe: Employe;
  items: DiplomeEmploye[] = [];
  secondViewBorder = 'warning';
  lightGradient = ['#fff', SETTINGS.topbarBg];
  constructor(public diplomeEmployeSrv: DiplomeEmployeService) {
  
  }

  ngOnInit(): void {
    this.findByEmploye();
  }
  
  handlePostDelete() {
    this.findByEmploye();
  }

  findByEmploye() {
    this.diplomeEmployeSrv.findByEmploye(this.employe)
    .subscribe((data: any)=>{
      this.items = data;
            
    },err=>this.diplomeEmployeSrv.httpSrv.catchError(err));
  }

  onCreate(item: DiplomeEmploye) {
    this.items = [item, ...this.items];
  }



  remove(entity: DiplomeEmploye) {
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
        this.diplomeEmployeSrv.remove(entity)
          .subscribe(() => {
            Swal.close();
            this.diplomeEmployeSrv.toastr.success("Suppression reussie");
            this.handlePostDelete();
          });
        // For more information about handling dismissals please visit
        // https://sweetalert2.github.io/#handling-dismissals
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.close();
        this.diplomeEmployeSrv.toastr.warning("Suppression annulée !");
      }
    });
  }

}
