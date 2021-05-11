import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy, Input } from '@angular/core';
import { Store } from '@ngrx/store';
import { StructureFonctionService } from '../structurefonction.service';
import { StructureFonction } from '../structurefonction';
import { Structure } from '../../structure/structure';
import Swal from 'sweetalert2';


@Component({
  selector: 'app-structurefonction-list',
  templateUrl: './structurefonction-list.component.html',
  styleUrls: ['./structurefonction-list.component.scss']
})
export class StructureFonctionListComponent extends BasePageComponent<StructureFonction> implements OnInit, OnDestroy {
  @Input() structure: Structure;
  constructor(store: Store<IAppState>,
    public structureFonctionSrv: StructureFonctionService) {
    super(store, structureFonctionSrv);

    this.pageData = {
      title: 'Liste des StructureFonctions',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des structurefonctions'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findAll();
  }

  ngOnDestroy() {
    this.subscriptions.forEach(subscription => subscription.unsubscribe());
  }

  handlePostDelete() {
    this.findAll();
  }

  findAll() {
    this.setLoaded();
    this
      .structureFonctionSrv
      .findByStructure(this.structure)
      .subscribe((items: any) => {
        this.items = items;
      }, err => {
        this.structureFonctionSrv.httpSrv.handleError(err);
      });
  }



  handlePostLoad() { }

  onChange(event: any, structureFonction: StructureFonction) {
    structureFonction.etat = event;
    Swal.fire({
      title: event ? 'Êtes-vous sûr de vouloir activer cette fonction ?' : 'Êtes-vous sûr de vouloir désactiver cette fonction ?',
      showCancelButton: true,
      confirmButtonText: event ? 'Activer' : 'Désactiver ?',
      cancelButtonText: 'Annuler',
      confirmButtonColor: event ? '#68d487' : '#d33',
      showLoaderOnConfirm: true,
      preConfirm: () => {
        return new Promise((resolve, reject) => {
          return this.structureFonctionSrv.update(structureFonction)
            .subscribe((data) => {
              resolve(data);
            }, (err) => {
              reject(err);
            });
        }).then((updatedUser: any) => {
          this.structureFonctionSrv.httpSrv.toastr.success('Modification effectuée avec succès.');
          Swal.close();
        }).catch(err => {
          this.structureFonctionSrv.httpSrv.catchError(err);
          Swal.fire(
            'Erreur!',
            'Une erreur est survenue lors de la modification.',
            'error'
          );
        });
      },
      onClose: () => {
        this.findAll();
      },

      allowOutsideClick: () => !Swal.isLoading()
    });
  }

  onCreated(createdItems: StructureFonction[]) {
    this.findAll();
  }

}
