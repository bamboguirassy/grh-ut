import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy, Input, EventEmitter, Output } from '@angular/core';
import { Store } from '@ngrx/store';
import { StructureFonctionService } from '../structurefonction.service';
import { StructureFonction } from '../structurefonction';
import { Structure } from '../../structure/structure';
import Swal from 'sweetalert2';
import { FonctionEmploye } from 'src/app/pages/gestionemploye/fonctionemploye/fonctionemploye';
import { Employe } from 'src/app/pages/gestionemploye/employe/employe';
import { EmployeService } from 'src/app/pages/gestionemploye/employe/employe.service';
import { FonctionEmployeService } from 'src/app/pages/gestionemploye/fonctionemploye/fonctionemploye.service';
import { Affectation } from 'src/app/pages/gestionemploye/affectation/affectation';
import { AffectationService } from 'src/app/pages/gestionemploye/affectation/affectation.service';


@Component({
  selector: 'app-structurefonction-list',
  templateUrl: './structurefonction-list.component.html',
  styleUrls: ['./structurefonction-list.component.scss']
})
export class StructureFonctionListComponent extends BasePageComponent<StructureFonction> implements OnInit, OnDestroy {

  @Input() structure: Structure;
  structureFonctionActive: StructureFonction;
  fonctionEmploye: FonctionEmploye = new FonctionEmploye();
  employes: Employe[] = [];
  selectedEmploye: Employe = new Employe();
  canChooseEmploye = false;
  isAffectation = false;
  currentFonctionEmploye: FonctionEmploye;
  affectation = new Affectation();

  constructor(store: Store<IAppState>, public employeSrv: EmployeService,
    public fonctionEmployeSrv: FonctionEmployeService,
    public affectationSrv: AffectationService,
    public structureFonctionSrv: StructureFonctionService,
  ) {
    super(store, structureFonctionSrv);
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findAll();
    this.fetchEmployes();
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
        this.structureFonctionActive = this.items.find(i => i.etat === true);
        if(this.structureFonctionActive) {
          this.findCurrentFonctionEmploye(this.structureFonctionActive);
        }
      }, err => {
        this.structureFonctionSrv.httpSrv.handleError(err);
      });
  }

  findCurrentFonctionEmploye(structureFonctionActive: StructureFonction) {
    this.addSubscription(
      this
        .fonctionEmployeSrv
        .findByResponsabilite(structureFonctionActive)
        .subscribe((fonctionEmploye: any) => {
          this.currentFonctionEmploye = fonctionEmploye;
        }, err => {
          this.fonctionEmployeSrv.httpSrv.handleError(err);
        })
    );
  }

  fetchEmployes() {
    this
      .employeSrv
      .employesProvider
      .subscribe((employes: Employe[]) => {
        this.employes = employes;
      }, err => {
        this.employeSrv.httpSrv.handleError(err);
      })
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

  assignFunction() {
    this.fonctionEmploye.employe = this.selectedEmploye.id;
    this.fonctionEmploye.responsabilite = this.structureFonctionActive.id;
    this.fonctionEmploye.etat = true;
    this
      .addSubscription(
        this
          .fonctionEmployeSrv
          .create(this.fonctionEmploye)
          .subscribe((createdFonctionEmploye: any) => {
            this.currentFonctionEmploye = createdFonctionEmploye;
            console.log(this.structure.id);
            console.log(this.selectedEmploye.structure.id);
            
            if (this.isAffectation && (this.structure.id !== this.selectedEmploye.structure.id || this.selectedEmploye.structure  === null)) {
              this.executeAffectationTrigger();
            }
          }, err => {
            this.fonctionEmployeSrv.httpSrv.handleError(err);
          })
      );
  }

  executeAffectationTrigger() {
    this.affectation.date = this.fonctionEmploye.datePriseFonction;
    this.affectation.employe = this.selectedEmploye.id;
    this.affectation.poste = this.structureFonctionActive.fonction.nom;
    this.affectation.structure = this.structureFonctionActive.structure.id;

    this.selectedEmploye.structure = this.structureFonctionActive.structure;
    this
      .addSubscription(
        this
          .affectationSrv
          .create(this.affectation)
          .subscribe((affectation: any) => {
            this.employeSrv.update(this.selectedEmploye);
          }, err => {
            this.affectationSrv.httpSrv.handleError(err);
          })
      );
  }


}
