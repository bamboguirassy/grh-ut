import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { EmployeService } from '../employe.service';
import { Employe } from '../employe';
import { TypeEmploye } from 'src/app/pages/parametrage/typeemploye/typeemploye';
import { TypeEmployeService } from 'src/app/pages/parametrage/typeemploye/typeemploye.service';
import Swal from 'sweetalert2';
import { TCModalService } from '../../../../ui/services/modal/modal.service';
import { Content } from '../../../../ui/interfaces/modal';
import * as ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { DatePipe } from '@angular/common';
import { StructureService } from 'src/app/pages/parametrage/structure/structure.service';
import { Structure } from 'src/app/pages/parametrage/structure/structure';
import { CaisseSociale } from 'src/app/pages/parametrage/caissesociale/caissesociale';
import { CaisseSocialeService } from 'src/app/pages/parametrage/caissesociale/caissesociale.service';
import { TypeContrat } from 'src/app/pages/parametrage/typecontrat/typecontrat';
import { TypeContratService } from 'src/app/pages/parametrage/typecontrat/typecontrat.service';
// import '@ckeditor/ckeditor5-build-classic/build/translations/fr';
@Component({
  selector: 'app-employe-list',
  templateUrl: './employe-list.component.html',
  styleUrls: ['./employe-list.component.scss']
})
export class EmployeListComponent extends BasePageComponent<Employe> implements OnInit, OnDestroy {
  emailEditor = ClassicEditor;
  emailEditionModel = {
    body: '',
    object: ''
  };
  config = {
    language: 'fr'
  };
  selectedEmployes: Employe[];
  selectedStructures: Structure[] = new Array();
  selectedTypeContrats: TypeContrat[] = [];
  isAllSelected = false;
  isPartialSelection = false;
  recrutementRangeDates = null;
  priseServiceRangeDates = null;
  structures: Array<Structure> = [];

  typeEmployes: TypeEmploye[] = [];
  caisseSociales: CaisseSociale[] = [];
  typeContrats: TypeContrat[] = [];
  temp: Employe[] = [];
  selectedIndex = 0;
  isModalVisible: boolean;
  selectedTypeEmployes: TypeEmploye[] = [];
  selectedRecrutementRange: Date[] = ['', ''] as any;
  selectedPriseServiceRange: Date[] = ['', ''] as any;
  selectedGenre = '';
  selectedCaisseSociales: CaisseSociale[] = [];
  constructor(
    private modal: TCModalService,
    public employeSrv: EmployeService,
    public datePipe: DatePipe,
    public caisseSocialeSrv: CaisseSocialeService,
    public typeContratSrv: TypeContratService,
    store: Store<IAppState>,
    public structureSrv: StructureService,
    public typeEmployeSrv: TypeEmployeService) {
    super(store, employeSrv);

    this.pageData = {
      title: 'Liste des employés',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des employés'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findTypeEmployes();
    this.findStructures();
    this.findCaisseSociales();
    this.findTypeContrats();
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostDelete() {
    this.findByTypeEmploye(this.typeEmployes[this.selectedIndex]);
  }

  handlePostLoad() {

  }

  findTypeContrats() {
    this
      .typeContratSrv
      .findWithAtLeastOneEmploye()
      .subscribe((typeContrats: any) => {
        this.typeContrats = typeContrats;
      }, err => {
        this.typeContratSrv.httpSrv.catchError(err);
      });
  }

  findStructures() {
    this
      .structureSrv
      .findWithAtLeastOneEmploye()
      .subscribe((structures: any) => {
        this.structures = structures;
      }, err => {
        this.structureSrv.httpSrv.catchError(err);
      });
  }


  findCaisseSociales() {
    this
      .caisseSocialeSrv
      .findWithAtLeastOneEmploye()
      .subscribe((caisseSociales: any) => {
        this.caisseSociales = caisseSociales;
      }, err => {
        this.caisseSocialeSrv.httpSrv.catchError(err);
      });
  }

  findTypeEmployes() {
    this.typeEmployeSrv.findAll()
      .subscribe((data: any) => {
        this.typeEmployes = data;
        this.selectedTypeEmployes = [data[0]];
        this.filterGlobal([], '');
        this.setLoaded();
      }, err => this.typeEmployeSrv.httpSrv.catchError(err));
  }

  findByTypeEmploye(typeEmploye: TypeEmploye) {
    this.items = [];
    this.employeSrv.findByTypeEmploye(typeEmploye)
      .subscribe((data: any) => {
        this.items = data;
      }, err => this.employeSrv.httpSrv.catchError(err));
  }

  handleTabChange(event) {
    this.findByTypeEmploye(this.typeEmployes[event.index]);
  }

  getSelectedEmployes() {
    return this.items.filter(item => item.selected);
  }
  toogleSendEmailModal<T>(body: Content<T>, header: Content<T> = null, footer: Content<T> = null, options: any = null) {
    this.selectedEmployes = this.getSelectedEmployes();
    if (!this.selectedEmployes.length) {
      Swal.fire('Vous devez d\'abord selectionner les employés dont vous voulez envoyer le mail');
      return;
    }
    this.modal.open({
      body,
      header,
      footer,
      options
    });
  }
  sendEmaillToSelectedEmployes() {
    if (this.emailEditionModel.object.length === 0 || this.emailEditionModel.body.length === 0) {
      this.employeSrv.toastr.error('Verifier si vous averz donnez l\'objet et le contenu');
      return;
    }

    const emails = this.selectedEmployes.map(val => val.email);
    this.employeSrv.sendEmail(emails, this.emailEditionModel.object, this.emailEditionModel.body)
      .subscribe(
        (data: any) => {
          this.handlePostLoad();
          this.employeSrv.toastr.success('Email Envoyé avec succès');
          this.closeModal();
          this.emailEditionModel = { body: '', object: '' };
          this.changeAllSelectionState(false);
          this.isAllSelected = false;
          this.isPartialSelection = false;

        },
        error => this.employeSrv.httpSrv.catchError(error));
  }
  closeModal() {
    this.modal.close();
  }


  changeAllSelectionStateLink() {

    this.isAllSelected = !this.isAllCheckt();
    this.changeAllSelectionState(this.isAllSelected);
    this.isPartialSelection = false;
  }


  changeAllSelectionState(state = false) {
    this.items.forEach(element => {
      element.selected = state;
    });
  }

  onItemsSelectionStateChange() {
    setTimeout(() => {
      this.isAllSelected = this.isAllCheckt();
      this.isPartialSelection = this.items.some(element => element.selected) && this.items.some(element => !(element.selected));
    }, 1);
  }

  /*findByTypeEmployes() {
    this
      .employeSrv
      .findByTypeEmployes(this.selectedTypeEmployes)
      .subscribe((employes: any) => {
        this.items = employes;
        this.items = [...this.items];
        if (this.items.length) {
          this.temp = [...this.items];
        }
      }, err => {
        this.employeSrv.httpSrv.catchError(err);
      });
  }*/

  filterGlobal(data: any, selectionType: string) {
    switch (selectionType) {
      case 'typeEmployes':
        this.selectedTypeEmployes = data;
        break;

      case 'structure':
        this.selectedStructures = data;
        break;

      case 'recrutementDates':
        this.selectedRecrutementRange = data;
        break;

      case 'priseServiceDates':
        this.selectedPriseServiceRange = data;
        break;

      case 'genre':
        this.selectedGenre = data;
        break;

      case 'caisseSociale':
        this.selectedCaisseSociales = data;
        break;

      case 'typeContrat':
        this.selectedTypeContrats = data;
        break;

      default:
        break;
    }

    this
      .employeSrv
      .globalFilter({
        typeEmployes: this.selectedTypeEmployes.map(e => e.id),
        structures: this.selectedStructures.map(s => s.id),
        recrutementDateRange: {
          startDate: this.datePipe.transform(this.selectedRecrutementRange[0], 'yyyy-MM-dd'),
          endDate: this.datePipe.transform(this.selectedRecrutementRange[1], 'yyyy-MM-dd')
        },
        priseServiceDateRange: {
          startDate: this.datePipe.transform(this.selectedPriseServiceRange[0], 'yyyy-MM-dd'),
          endDate: this.datePipe.transform(this.selectedPriseServiceRange[1], 'yyyy-MM-dd')
        },
        genre: this.selectedGenre,
        caisseSociales: this.selectedCaisseSociales.map(cs => cs.id),
        typeContrats: this.selectedTypeContrats.map(tc => tc.id)
      })
      .subscribe((employes: any) => {
        this.items = employes;
        this.items = [...this.items];
        if (this.items.length) {
          this.temp = [...this.items];
        }
      }, err => {
        this.employeSrv.httpSrv.catchError(err);
      });
  }

  /*findByStructures() {
    if (this.selectedStructures.length > 0) {
      this
        .employeSrv
        .findByManyStructure(this.selectedStructures)
        .subscribe((employes: any) => {
          this.items = employes;
          this.items = [...this.items];
          if (this.items.length) {
            this.temp = [...this.items];
          }
        }, err => {
          this.employeSrv.httpSrv.catchError(err);
        });
    }

  }*/

  /*(results: Date[]): void {
    this.selectedRange = results;
    if (results.length === 2) {
      this
        .employeSrv
        .findByDateRecrutementRange(this.datePipe.transform(results[0], 'yyyy-MM-dd'), this.datePipe.transform(results[1], 'yyyy-MM-dd'))
        .subscribe((employes: any) => {
          this.items = employes;
          this.items = [...this.items];
        }, err => {
          this.employeSrv.httpSrv.catchError(err);
        });
    }
  }*/

  isAllCheckt() {
    return this.items.every(element => element.selected);
  }

  restore() {
    this.items = this.temp;
    this.items = [...this.items];
  }
}
