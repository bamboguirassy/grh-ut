import { SETTINGS } from './../../../../../environments/settings';
import { Component, OnInit, Input } from '@angular/core';
import { AdresseService } from '../adresse.service';
import { Adresse } from '../adresse';
import { Employe } from '../../employe/employe';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-adresse-list',
  templateUrl: './adresse-list.component.html',
  styleUrls: ['./adresse-list.component.scss']
})
export class AdresseListComponent implements OnInit {

  @Input() employe: Employe;
  items: Adresse[] = [];
  secondViewBorder = 'warning';
  lightGradient = ['#fff', SETTINGS.topbarBg];
  
  constructor(public adresseSrv: AdresseService) {}

  ngOnInit(): void {
    this.findByEmploye();
  }

  handlePostDelete() {
    this.findByEmploye();
  }

  findByEmploye() {
    this.adresseSrv.findByEmploye(this.employe)
    .subscribe((data: any)=>{
      this.items = data;
    },err=>this.adresseSrv.httpSrv.catchError(err));
  }

  onCreate(item: Adresse) {
    this.items = [item, ...this.items];
  }

  remove(entity: Adresse) {
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
        this.adresseSrv.remove(entity)
          .subscribe(() => {
            Swal.close();
            this.adresseSrv.toastr.success("Suppression reussie");
            this.handlePostDelete();
          });
        // For more information about handling dismissals please visit
        // https://sweetalert2.github.io/#handling-dismissals
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.close();
        this.adresseSrv.toastr.warning("Suppression annulée !");
      }
    });
  }

}
