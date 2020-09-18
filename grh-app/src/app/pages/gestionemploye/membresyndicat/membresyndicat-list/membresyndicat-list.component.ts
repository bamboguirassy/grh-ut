import { SETTINGS } from './../../../../../environments/settings';
import { Component, OnInit, Input } from '@angular/core';
import { MembreSyndicatService } from '../membresyndicat.service';
import { MembreSyndicat } from '../membresyndicat';
import { DatePipe } from '@angular/common';
import Swal from 'sweetalert2';
import { Employe } from '../../employe/employe';

@Component({
  selector: 'app-membresyndicat-list',
  templateUrl: './membresyndicat-list.component.html',
  styleUrls: ['./membresyndicat-list.component.scss']
})
export class MembreSyndicatListComponent  implements OnInit {

  @Input() employe: Employe;
  items: MembreSyndicat[] = [];
  secondViewBorder = 'warning';
  lightGradient = ['#fff', SETTINGS.topbarBg];

  constructor(public membreSyndicatSrv: MembreSyndicatService) {}

    ngOnInit(): void {
      this.findByEmploye();
    }
  
    handlePostDelete() {
      this.findByEmploye();
    }
  
    findByEmploye() {
      this.membreSyndicatSrv.findByEmploye(this.employe)
      .subscribe((data: any)=>{
        this.items = data;
      },err=>this.membreSyndicatSrv.httpSrv.catchError(err));
    }
  
    onCreate(item: MembreSyndicat) {
      this.items = [item, ...this.items];
    }
  
    remove(entity: MembreSyndicat) {
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
          this.membreSyndicatSrv.remove(entity)
            .subscribe(() => {
              Swal.close();
              this.membreSyndicatSrv.toastr.success("Suppression reussie");
              this.handlePostDelete();
            });
          // For more information about handling dismissals please visit
          // https://sweetalert2.github.io/#handling-dismissals
        } else if (result.dismiss === Swal.DismissReason.cancel) {
          Swal.close();
          this.membreSyndicatSrv.toastr.warning("Suppression annulée !");
        }
      });
    }

}
