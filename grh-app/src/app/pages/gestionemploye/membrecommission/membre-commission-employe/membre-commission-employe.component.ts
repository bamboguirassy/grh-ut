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
import {Router} from "@angular/router";
import {Store} from "@ngrx/store";
import {IAppState} from "src/app/interfaces/app-state";
import {BasePageComponent} from "src/app/pages/base-page/base-page.component";
import {MembreCommission} from "src/app/pages/gestionemploye/membrecommission/membrecommission";
import {MembreCommissionService} from "src/app/pages/gestionemploye/membrecommission/membrecommission.service";
import {Commission} from "src/app/pages/parametrage/commission/commission";
import {Employe} from "../../employe/employe";

@Component({selector: "app-membre-commission-employe", templateUrl: "./membre-commission-employe.component.html", styleUrls: ["./membre-commission-employe.component.scss"]})
export class MembreCommissionEmployeComponent
extends BasePageComponent<MembreCommission>
implements OnInit,
OnDestroy {
  @ViewChild("modalBody", {static: true})modalBody: ElementRef<any>;
  @ViewChild("modalFooter", {static: true})modalFooter: ElementRef<any>;
  @ViewChildren("form")form;
  @Output()dataSearchEvent: EventEmitter<String> = new EventEmitter();
  @Input()commission: Commission;
  employes: Employe[] = [];
  selectedEmploye: Employe;
  isShowable: boolean = false;
  isModalVisible: boolean;
  activeLoad: boolean = false;
  searchTerm: string;

  constructor(store : Store<IAppState>, private membreCommissionSrv : MembreCommissionService, private router : Router) {
    super(store, membreCommissionSrv);
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findMembresOfCommission(this.commission);
  }

  openModal() {
    this.isModalVisible = true;
    this.initNewMembreCommission();
  }

  initNewMembreCommission() {
    this.entity = new MembreCommission();
    this.entity.statut = true;
    this.entity.commission = this.commission;
  }

  searchEmploye() {
    if (this.searchTerm.length > 3) {
      this.membreCommissionSrv.searchEmploye(this.searchTerm)
        .subscribe((data: any) => {
          this.employes = data;
        }, err => this.membreCommissionSrv.httpSrv.catchError(err));
    }
  }

  onInput(event: Event){
    const value = (event.target as HTMLInputElement).value;
    console.log("ONINPUR::::::::::::", value);
  }

  save() {
    console.log("NOUVEAU EMPLOYE DANS LA COMMISSION " + this.commission.nom, this.entity);
  }

  // close modal window
  closeModal() {
    this.isModalVisible = false;
  }

  /**
   * Permet d'avoir le route pour voir les infos de l'employé
   * @param employe employe
   * @returns route
   */
  employeRoute(employe : Employe): string[]{
    let url: string = this.router.url;
    return ["/" + url.split("/")[1] + "/employe/" + employe.id];
  }

  private findMembresOfCommission(commission : Commission) {
    this.membreCommissionSrv.findMembresOfCommission(commission).subscribe((data : any) => {
      this.isShowable = true;
      this.items = data;
    }, (err) => this.membreCommissionSrv.httpSrv.catchError(err));
  }
}
