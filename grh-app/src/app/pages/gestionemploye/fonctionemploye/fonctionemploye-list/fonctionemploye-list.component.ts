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
  selectedFonction: FonctionEmploye;
  tab =  [];
  @Input() fonctionEmploiyes: FonctionEmploye[] = [];
  items: Document[] = [];
  secondViewBorder = 'warning';
  lightGradient = ['#fff', SETTINGS.topbarBg];

  constructor(public fonctionEmployeSrv: FonctionEmployeService,  private activatedRoute: ActivatedRoute, public datePipe: DatePipe) {}

  ngOnInit(): void {
    this.findByEmploye();
  }
  
  setTimeline() {
    const sectionData = this.items.map((i: any) => ({
     date: `${i.datePriseFonction?`${this.datePipe.
      transform(`${i.datePriseFonction}` , 'dd/MM/yyyy')}`
      :'Indefini'} - ${i.etat?'En Cours'
      :`${i.dateFin?`${this.datePipe.transform(`${i.dateFin}`
       , 'dd/MM/yyyy')}`:'En Cours'}`}`,
      title: i.responsabilite.fonction.nom,
      content: i.responsabilite.structure.nom,
      icon: "icofont-business-man-alt-1",
      iconBg: SETTINGS.sidebarBg,
      iconColor: "#fff"
    }))
    this.tab = [
      {
        "sectionLabel": {
          "text": "Fonction Structure",
          "view": "error"
        },
        "sectionData": sectionData
      },
    ];
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
      this.setTimeline();
    },err=>this.fonctionEmployeSrv.httpSrv.catchError(err));
  }
  

  onCreate(item: Document) {
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
