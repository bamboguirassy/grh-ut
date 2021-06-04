import { MembreFamille } from './../membrefamille';
import { Component, OnInit, OnDestroy, Input } from '@angular/core';
import { MembreFamilleService } from '../membrefamille.service';
import { SETTINGS } from 'src/environments/settings';
import Swal from 'sweetalert2';
import { Employe } from '../../employe/employe';

@Component({
  selector: 'app-membrefamille-list',
  templateUrl: './membrefamille-list.component.html',
  styleUrls: ['./membrefamille-list.component.scss']
})
export class MembreFamilleListComponent implements OnInit {
  selectedMembreFamille: MembreFamille;
  @Input() employe: Employe;
  items: MembreFamille[] = [];
  secondViewBorder = 'warning';
  lightGradient = ['#fff', SETTINGS.topbarBg];

  constructor(public membreFamilleSrv: MembreFamilleService) {}

  ngOnInit(): void {
    this.findByEmploye();
  }
  
  onClose(){
    this.selectedMembreFamille = null;
  }

  setSelectedMembreFamille(element: MembreFamille){
    this.selectedMembreFamille = element;
  }
  

  handlePostDelete() {
    this.findByEmploye();
  }

  findByEmploye() {
    this.membreFamilleSrv.findByEmploye(this.employe)
    .subscribe((data: any)=>{
      this.items = data;
    },err=>this.membreFamilleSrv.httpSrv.catchError(err));
  }

  onCreate(item: MembreFamille) {
    this.items = [item, ...this.items];
  }

  remove(entity: MembreFamille) {
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
        this.membreFamilleSrv.remove(entity)
          .subscribe(() => {
            Swal.close();
            this.membreFamilleSrv.toastr.success("Suppression reussie");
            this.handlePostDelete();
          });
        // For more information about handling dismissals please visit
        // https://sweetalert2.github.io/#handling-dismissals
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.close();
        this.membreFamilleSrv.toastr.warning("Suppression annulée !");
      }
    });
  }

}
