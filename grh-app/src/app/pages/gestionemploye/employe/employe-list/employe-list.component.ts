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
import '@ckeditor/ckeditor5-build-classic/build/translations/fr';
@Component({
  selector: 'app-employe-list',
  templateUrl: './employe-list.component.html',
  styleUrls: ['./employe-list.component.scss']
})
export class EmployeListComponent extends BasePageComponent<Employe> implements OnInit, OnDestroy {
  emailEditor = ClassicEditor;
  emailEditorModle = '<p>Hello, world!</p>';
  config = {
    language: 'fr'
  };
  slelctedEmployes: Employe[] = [];


  typeEmployes: TypeEmploye[] = [];
  selectedIndex = 0;
  constructor(
    private modal: TCModalService,
    store: Store<IAppState>,
    public employeSrv: EmployeService,
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
    
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostDelete() {
    this.findByTypeEmploye(this.typeEmployes[this.selectedIndex]);
  }

  handlePostLoad() { }

  findTypeEmployes() {
    this.typeEmployeSrv.findAll()
      .subscribe((data: any) => {
        this.typeEmployes = data;
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

  getSelectedEmployes(){
    return this.items.filter(item => item.selected);
  }
  toogleSendEmailModal<T>(body: Content<T>, header: Content<T> = null, footer: Content<T> = null, options: any = null){
    this.slelctedEmployes = this.getSelectedEmployes();
    if (!this.slelctedEmployes.length){
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
  closeModal() {
    this.modal.close();
  }
}
