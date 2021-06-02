import { Employe } from './../../../gestionemploye/employe/employe';
import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy, ViewChild, ElementRef, ViewChildren } from '@angular/core';
import { Store } from '@ngrx/store';
import { ProfessionService } from '../profession.service';
import { Profession } from '../profession';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-profession-list',
  templateUrl: './profession-list.component.html',
  styleUrls: ['./profession-list.component.scss']
})
export class ProfessionListComponent extends BasePageComponent<Profession> implements OnInit, OnDestroy {
  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  itemDeletes: any;
  isModalVisible = false;
  selectedForceDelete: any;
  loadDelete: any;
  constructor(store: Store<IAppState>,
              public professionSrv: ProfessionService) {
    super(store, professionSrv);

    this.pageData = {
      title: 'Liste des professions',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des professions'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findAll();
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostDelete() {
    this.findAll();
  }

  handlePostLoad(){}

  remove(entity: Profession) {
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
        this.httpSv.remove(entity)
          .subscribe((data: any) => {
            this.loadDelete = data.isTrue;
            if(this.loadDelete){
              this.openModal();
              this.itemDeletes = data;
              this.setSelectedDelete(entity);
            }
            Swal.close();
            //this.httpSv.toastr.success("Suppression reussie");
            this.handlePostDelete();
          },err=>this.httpSv.httpSrv.catchError(err));
        // For more information about handling dismissals please visit
        // https://sweetalert2.github.io/#handling-dismissals
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.close();
        this.httpSv.toastr.warning("Suppression annulée !");
        this.loadDelete = false;
      }
    });
  }

  forceRemove(entity: Profession){
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
        this.professionSrv.forceDelete(entity)
          .subscribe(() => {
            Swal.close();
            this.httpSv.toastr.success("Suppression reussie");
            this.handlePostDelete();
            this.closeModal();
          },err=>this.httpSv.httpSrv.catchError(err));
        // For more information about handling dismissals please visit
        // https://sweetalert2.github.io/#handling-dismissals
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.close();
        this.httpSv.toastr.warning("Suppression annulée !");
        this.loadDelete = false;
        this.closeModal();
      }
    });
  }

  // open modal window
  openModal() {
    this.isModalVisible = true;
  }

  // close modal window
  closeModal() {
    this.isModalVisible = false;
    this.selectedForceDelete = null;
  }

  setSelectedDelete(element){
    this.selectedForceDelete = element;
  }

}
