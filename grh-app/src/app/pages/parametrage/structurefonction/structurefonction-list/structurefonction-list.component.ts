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
  @Output() functionStateChange: EventEmitter<any> = new EventEmitter<any>();
  structureFonctionActive: StructureFonction;
  fonctionEmploye: FonctionEmploye = new FonctionEmploye();
  employes: Employe[] = [];
  selectedEmploye: Employe = new Employe();
  canChooseEmploye = false;
  isAffectation = false;
  currentFonctionEmploye: FonctionEmploye;
  affectation = new Affectation();
  canChooseDateFin = false;


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
        if (this.structureFonctionActive) {
          this.findCurrentFonctionEmploye(this.structureFonctionActive);
        }
      }, err => {
        this.structureFonctionSrv.httpSrv.catchError(err);
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
          this.fonctionEmployeSrv.httpSrv.catchError(err);
        })
    );
  }

  searchEmployes(term: any) {
    if (term.length) {
      this
        .employeSrv
        .realtimeSearch(term)
        .subscribe((employes: any) => {
          this.employes = employes;
        }, err => {
          this.employeSrv.httpSrv.catchError(err);
        });
    }
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
          structureFonction.etat = !event;
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

  disableCurrentFonctionEmploye() {
    this.currentFonctionEmploye.etat = false;
    Swal.fire({
      title: event ? 'Êtes-vous sûr de vouloir activer la fonction de cet employé ?' : 'Êtes-vous sûr de vouloir désactiver la fonction de cet employé ?',
      showCancelButton: true,
      confirmButtonText: event ? 'Activer' : 'Désactiver ?',
      cancelButtonText: 'Annuler',
      confirmButtonColor: event ? '#68d487' : '#d33',
      showLoaderOnConfirm: true,
      preConfirm: () => {
        return new Promise((resolve, reject) => {
          return this.fonctionEmployeSrv.update(this.currentFonctionEmploye)
            .subscribe((data) => {
              resolve(data);
            }, (err) => {
              reject(err);
            });
        }).then((updatedFe: any) => {
          this.currentFonctionEmploye = updatedFe;
          this.functionStateChange.emit();
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
    if (this.structureFonctionActive.duree > 0) {
      let dateDeb = new Date(this.fonctionEmploye.datePriseFonction);
      const duree = +this.structureFonctionActive.duree;
      let dateFin = new Date(dateDeb.setMonth(dateDeb.getMonth() + duree));
      this.fonctionEmploye.dateFin = dateFin as any;
    }
    this
      .addSubscription(
        this
          .fonctionEmployeSrv
          .create(this.fonctionEmploye)
          .subscribe((createdFonctionEmploye: any) => {
            this.currentFonctionEmploye = createdFonctionEmploye;
            if (!this.isAffectation) {
              this.functionStateChange.emit();
            }
            if (this.isAffectation && (this.structure.id !== this.selectedEmploye.structure.id || this.selectedEmploye.structure === null)) {
              this.executeAffectationTrigger();
            }
          }, err => {
            this.fonctionEmployeSrv.httpSrv.catchError(err);
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
            this
              .employeSrv
              .update(this.selectedEmploye)
              .subscribe(data => {
                this.functionStateChange.emit();
              }, err => {
                this.structureFonctionSrv.httpSrv.catchError(err);
              })
          }, err => {
            this.affectationSrv.httpSrv.catchError(err);
          })
      );
  }


}
