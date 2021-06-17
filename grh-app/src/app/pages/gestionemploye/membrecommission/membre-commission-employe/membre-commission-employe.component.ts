import { DatePipe } from "@angular/common";
import {
  Component,
  ElementRef,
  EventEmitter,
  Input,
  OnDestroy,
  OnInit,
  Output,
  ViewChild,
  ViewChildren
} from "@angular/core";
import { Router } from "@angular/router";
import { Store } from "@ngrx/store";
import { IAppState } from "src/app/interfaces/app-state";
import { BasePageComponent } from "src/app/pages/base-page/base-page.component";
import { MembreCommission } from "src/app/pages/gestionemploye/membrecommission/membrecommission";
import { MembreCommissionService } from "src/app/pages/gestionemploye/membrecommission/membrecommission.service";
import { Commission } from "src/app/pages/parametrage/commission/commission";
import { Employe } from "../../employe/employe";

@Component({ selector: "app-membre-commission-employe", templateUrl: "./membre-commission-employe.component.html", styleUrls: ["./membre-commission-employe.component.scss"] })
export class MembreCommissionEmployeComponent
  extends BasePageComponent<MembreCommission>
  implements OnInit,
  OnDestroy {
  @ViewChild("modalBody", { static: true }) modalBody: ElementRef<any>;
  @ViewChild("modalFooter", { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren("form") form;
  @Output() creation: EventEmitter<MembreCommission> = new EventEmitter();
  @Input() commission: Commission;
  employes: Employe[] = [];
  searchResult: string[] = [];
  selectedEmploye: Employe;
  selectedMembre: MembreCommission;
  isShowable: boolean = false;
  isModalVisible: boolean = false;
  activeLoad: boolean = false;
  inputValue?: string;
  isEditModalVisible: boolean = false;

  constructor(store: Store<IAppState>, public datePipe: DatePipe, public membreCommissionSrv: MembreCommissionService, private router: Router) {
    super(store, membreCommissionSrv);
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findMembresOfCommission(this.commission);
  }

  private initNewMembreCommission(): void {
    this.entity = new MembreCommission();
    this.entity.statut = false;
    this.entity.dateSortie = null;
    this.entity.motifSortie = null;
  }

  /**
   * RealTime seach
   * @param data searchTerm
   */
  searchEmploye(data: String) {
    this.activeLoad = false;
    if (data.length > 3) {
      this.membreCommissionSrv.searchEmploye(data).subscribe((data: any) => {
        this.activeLoad = true;
        this.employes = data;
        this.searchResult = this.employes.map<string>((employe: Employe) => "# " + employe.matricule + " - " + employe.prenoms + " " + employe.nom);
      }, (err) => this.membreCommissionSrv.httpSrv.catchError(err));
    }
  }

  /**
   * Call when input value is changing
   * @param event event
   */
  onInput(event: Event) {
    const value = (event.target as HTMLInputElement).value;
    this.searchEmploye(value);
  }

  /**
   * Create a new MemberCommission
   * @returns void
   */
  save() {
    this.selectedEmploye = this.employes[this.searchResult.indexOf(this.inputValue)];
    if (!this.selectedEmploye) {
      this.membreCommissionSrv.toastError("L'employé selectioné, n'existe pas.");
      return;
    }
    this.entity.employe = this.selectedEmploye.id;
    this.entity.commission = this.commission.id;

    this.membreCommissionSrv.create(this.entity).subscribe((data: any) => {
      this.entity.employe = this.selectedEmploye;
      this.entity.commission = this.commission;
      this.onCreate(this.entity);
      this.searchResult = [];
      this.closeAddModal();
      this.membreCommissionSrv.toastSuccess("Vous avez ajouté un nouveau membre.");
    }, (err) => this.membreCommissionSrv.httpSrv.catchError(err));
  }

  openAddModal() {
    this.isModalVisible = true;
    this.initNewMembreCommission();
  }

  closeAddModal() {
    this.isModalVisible = false;
  }

  /**
   * Permet d'avoir le route pour voir les infos de l'employé
   * @param employe employe
   * @returns route
   */
  employeRoute(employe: Employe): string[] {
    let url: string = this.router.url;
    return ["/" + url.split("/")[1] + "/employe/" + employe.id];
  }

  openEditModal(membreCommission: MembreCommission) {
    this.cloneEditMember(membreCommission);
    this.isEditModalVisible = true;
  }

  cloneEditMember(membreCommission: MembreCommission) {
    this.selectedMembre = new MembreCommission();
    this.selectedMembre.commission = membreCommission.commission.id;
    this.selectedMembre.dateIntegration = membreCommission.dateIntegration;
    this.selectedMembre.dateSortie = membreCommission.dateSortie;
    this.selectedMembre.fonction = membreCommission.fonction;
    this.selectedMembre.statut = membreCommission.statut;
    this.selectedMembre.id = membreCommission.id;
    this.selectedMembre.employe = membreCommission.employe;
    this.selectedMembre.motifSortie = membreCommission.motifSortie; 
  }

  closeEditModal() {
    this.isEditModalVisible = false;
  }

  prepareUpdate() {
    if (this.selectedMembre.dateIntegration) {
      this.selectedMembre.dateIntegration = this.datePipe.transform(this.selectedMembre.dateIntegration, "yyyy-MM-dd");
    }
    if (this.selectedMembre.dateSortie) {
      this.selectedMembre.dateSortie = this.datePipe.transform(this.selectedMembre.dateSortie, "yyyy-MM-dd");
    }
    if (this.selectedMembre.statut) {
      this.selectedMembre.motifSortie = null;
      this.selectedMembre.dateSortie = null;
    }
  }

  /**
   * Update a MemberCommission
   */
  update() {
    this.prepareUpdate();
    this.membreCommissionSrv.update(this.selectedMembre).subscribe((resp: any) => {
      this.closeEditModal();
      this.findMembresOfCommission();
      this.membreCommissionSrv.toastSuccess("Membre modifié avec success");
    }, (err) => {
      this.membreCommissionSrv.httpSrv.catchError(err);
    });
  }

  /**
   * Find all members for the current commission
   * @param commission the current commission
   */
  findMembresOfCommission(commission: Commission = this.commission) {
    this.membreCommissionSrv.findMembresOfCommission(commission).subscribe((data: any) => {
      this.isShowable = true;
      this.items = data;
    }, (err) => this.membreCommissionSrv.httpSrv.catchError(err));
  }

  handlePostDelete() {
    this.findMembresOfCommission(this.commission);
  }
}
