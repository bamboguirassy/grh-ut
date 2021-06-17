import { Component, Input, OnInit } from '@angular/core';
import { DocumentService } from '../document.service';
import { Document } from '../document';
import { SETTINGS } from 'src/environments/settings';
import { Employe } from '../../employe/employe';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-document-list',
  templateUrl: './document-list.component.html',
  styleUrls: ['./document-list.component.scss']
})
export class DocumentListComponent implements OnInit {

  @Input() employe: Employe;
  items: Document[] = [];
  secondViewBorder = 'warning';
  lightGradient = ['#fff', SETTINGS.topbarBg];

  constructor(public documentSrv: DocumentService) {
  }

  ngOnInit(): void {
    this.findByEmploye();
  }

  handlePostDelete() {
    this.findByEmploye();
  }

  findByEmploye() {
    this.documentSrv.findByEmploye(this.employe)
    .subscribe((data: any)=>{
      this.items = data;
    },err=>this.documentSrv.httpSrv.catchError(err));
  }

  onCreate(item: Document) {
    this.items = [item, ...this.items];
  }

  remove(entity: Document) {
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
        this.documentSrv.remove(entity)
          .subscribe(() => {
            Swal.close();
            this.documentSrv.toastr.success("Suppression reussie");
            this.handlePostDelete();
          });
        // For more information about handling dismissals please visit
        // https://sweetalert2.github.io/#handling-dismissals
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.close();
        this.documentSrv.toastr.warning("Suppression annulée !");
      }
    });
  }

}
