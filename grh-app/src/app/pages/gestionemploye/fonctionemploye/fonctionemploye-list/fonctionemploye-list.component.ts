import { ActivatedRoute } from '@angular/router';
import { Component, OnInit, Input } from '@angular/core';
import { FonctionEmployeService } from '../fonctionemploye.service';
import { FonctionEmploye } from '../fonctionemploye';
import Swal from 'sweetalert2';
import { SETTINGS } from 'src/environments/settings';
import { Employe } from '../../employe/employe';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-fonctionemploye-list',
  templateUrl: './fonctionemploye-list.component.html',
  styleUrls: ['./fonctionemploye-list.component.scss']
})
export class FonctionEmployeListComponent implements OnInit {
  @Input() employe: Employe;
  tab =  [];
  selectedFonction: FonctionEmploye;
  items: FonctionEmploye[] = [];
  secondViewBorder = 'warning';
  lightGradient = ['#fff', SETTINGS.topbarBg];
  @Input() displayTimeline: boolean = true;

  constructor(public fonctionEmployeSrv: FonctionEmployeService,  private activatedRoute: ActivatedRoute,) {}

  ngOnInit(): void {
    this.findByEmploye();
  }
  
 

  setSelectedFonction(element: FonctionEmploye){
      this.selectedFonction = element;
  }
  

  handlePostDelete() {
    this.findByEmploye();
  }

  findByEmploye() {
    this.fonctionEmployeSrv.findByEmploye(this.employe)
    .subscribe((data: any)=>{
      this.items = data;
     
    },err=>this.fonctionEmployeSrv.httpSrv.catchError(err));
  }
  

  onCreate(item: FonctionEmploye) {
    this.items = [item, ...this.items];
  }

  onClose(){
    this.selectedFonction = null;
  }
 

  remove(entity: FonctionEmploye) {
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
        this.fonctionEmployeSrv.remove(entity)
          .subscribe(() => {
            Swal.close();
            this.fonctionEmployeSrv.toastr.success("Suppression reussie");
            this.handlePostDelete();
          });
        // For more information about handling dismissals please visit
        // https://sweetalert2.github.io/#handling-dismissals
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.close();
        this.fonctionEmployeSrv.toastr.warning("Suppression annulée !");
      }
    });
  }
  

}
