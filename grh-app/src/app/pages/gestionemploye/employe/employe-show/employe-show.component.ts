import { split } from 'ts-node';
import { Component, OnInit, OnDestroy,ViewChild, ElementRef, Output, EventEmitter, ViewChildren, Input } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { EmployeService } from '../employe.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { Employe } from '../employe';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { FonctionEmployeService } from '../../fonctionemploye/fonctionemploye.service';
import { first } from 'rxjs/operators';
import { FonctionEmploye } from '../../fonctionemploye/fonctionemploye';
import { BamboAuthService } from 'src/app/shared/services/bambo-auth.service';
import { FormGroup } from '@angular/forms';
import { SETTINGS } from 'src/environments/settings';
import * as ClassicEditor from '@ckeditor/ckeditor5-build-classic';


@Component({
  selector: 'app-employe-show',
  templateUrl: './employe-show.component.html',
  styleUrls: ['./employe-show.component.scss']
})
export class EmployeShowComponent extends BasePageComponent<Employe> implements OnInit, OnDestroy {
  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  isModalVisible = false;
  editor = ClassicEditor;
  public email= {
      object: '',
      message: ''
    };
  entity: Employe;
  employeForm: FormGroup;
  latestFonctions: FonctionEmploye[];
  photo: any;
  filename: any;
  image: any;
  currentAvatar: any;
  changes: boolean;
  isAdresseLoaded = false;
  isFamilleLoaded = false;
  isSyndicatsLoaded = false;
  isCommissionsLoaded = false;
  isDocumentsLoaded = false;
  isFonctionsLoaded = false;
  isGradeLoaded = false;
  isDiplomeLoaded = false;
  isContratLoaded = false;
  isCommissionLoaded = false;
  titre: string;
  topbarBg = SETTINGS.topbarBg;
  isAffectationLoaded = false;

  constructor(store: Store<IAppState>,
    public employeSrv: EmployeService, public fonctionEmployeSrv: FonctionEmployeService,
    private activatedRoute: ActivatedRoute,
    public authSrv: BamboAuthService,
    public location: Location) {
    super(store, employeSrv);
    this.pageData = {
      title: '',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des employés',
          route: '/' + this.orientation + '/employe'
        },
        {
          title: 'Affichage'
        }
      ]
    };
    activatedRoute.params.subscribe(() => {
      this.findEntity(this.activatedRoute.snapshot.params.id);
      setTimeout(() => {
        this.isAdresseLoaded = false;
        this.isFamilleLoaded = false;
        this.isSyndicatsLoaded = false;
        this.isCommissionsLoaded = false;
        this.isDocumentsLoaded = false;
        this.isFonctionsLoaded = false;
        this.isGradeLoaded = false;
        this.isDiplomeLoaded = false;
        this.isContratLoaded = false;
        this.isCommissionLoaded = false;
      }, 0);
      this.loadAdressesTab();
      this.loadFamillesTab();
    });
  }

  ngOnInit(): void {
    super.ngOnInit();
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.title = this.entity?.prenoms + ' ' + this.entity?.nom + ' (' + this.entity?.matricule + ')';
    this.findLatestFonction();
    this.setTitre();
    this.loadFamillesTab();
    this.loadAdressesTab();
  }

  handlePostDelete() {
    this.location.back();
  }

  setTitre() {
    if (this.entity.genre == 'Féminin') {
      if (this.entity.situtationMatrimoniale == 'Célibataire') {
        this.titre = "Mlle";
      } else {
        this.titre = "Mme";
      }
    } else {
      this.titre = "M.";
    }
  }

  findLatestFonction() {
    this
      .fonctionEmployeSrv
      .findLatest(this.entity)
      .subscribe((data: any) => {
        this.latestFonctions = data;
      }, err => {
        this.fonctionEmployeSrv.httpSrv.handleError(err);
      })
  }

  // upload new file
  onFileChanged(inputValue: any) {
    let file: File = inputValue.target.files[0];
    let reader: FileReader = new FileReader();
    reader.onloadend = () => {
      this.currentAvatar = reader.result;
      this.employeSrv.uploadPhoto(this.entity, this.currentAvatar.split(',')[1], file.name.split('.')[0])
        .subscribe(
          (data: any) => {
            this.entity = data;
            this.employeSrv.toastr.success('Photo mise à jour !')
          },
          error => this.employeSrv.httpSrv.catchError(error))
    };
    reader.readAsDataURL(file);
  }

  loadAdressesTab() {
    setTimeout(() => {
      this.isAdresseLoaded = true;
    }, 0);
  }

  loadFamillesTab() {
    setTimeout(() => {
      this.isFamilleLoaded = true;
    }, 0);
  }

  loadSyndicatsTab() {
    setTimeout(() => {
      this.isSyndicatsLoaded = true;
    }, 0);
  }

  loadDocumentsTab() {
    setTimeout(() => {
      this.isDocumentsLoaded = true;
    }, 0);
  }

  loadFonctionsTab() {
    setTimeout(() => {
      this.isFonctionsLoaded = true;
    }, 0);
  }

  loadGradesTab() {
    setTimeout(() => {
      this.isGradeLoaded = true;
    }, 0);
  }

  loadDiplomesTab() {
    setTimeout(() => {
      this.isDiplomeLoaded = true;
    }, 0);
  }
  loadContratsTab() {
    setTimeout(() => {
      this.isContratLoaded = true;
    }, 0);
  }

  loadAffectationsTab() {
    setTimeout(() => {
      this.isAffectationLoaded = true;
    }, 0);
  }

  loadCommissionsTab() {
    setTimeout(() => {
      this.isCommissionsLoaded = true;
    }, 0);
  }

 // open modal window
  openModal() {
    setTimeout(() => {
      this.isModalVisible = true;
    }, 0);
  }

  // close modal window
  closeModal() {
    setTimeout(() => {
      this.isModalVisible = false;
    }, 0);
  }
  sendSingleEmail(){
    if(this.email.object.length==0 || this.email.message.length==0){
      this.employeSrv.toastr.error('Verifier vos champs');
      return;
    }
    this.employeSrv.sendEmail([this.entity.id],this.email.object,this.email.message)
    .subscribe(
      (data: any) => {
        this.employeSrv.toastr.success('Email Envoyé avec succès')
        this.closeModal(); 
        this.email.object=""
        this.email.message=""
      },
      error => this.employeSrv.httpSrv.catchError(error))

  }
    
      
    

}
