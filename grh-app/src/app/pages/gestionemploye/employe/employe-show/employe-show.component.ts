import { split} from 'ts-node';
import { Component, OnInit, OnDestroy } from '@angular/core';
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

@Component({
  selector: 'app-employe-show',
  templateUrl: './employe-show.component.html',
  styleUrls: ['./employe-show.component.scss']
})
export class EmployeShowComponent extends BasePageComponent<Employe> implements OnInit, OnDestroy {
  entity: Employe;
  employeForm: FormGroup;
  latestFonction: FonctionEmploye;
  photo: any;
  filename: any;
  image:any;
  currentAvatar: any;
  defaultAvatar: string;
  changes: boolean;

  constructor(store: Store<IAppState>,
    public employeSrv: EmployeService, public fonctionEmployeSrv: FonctionEmployeService,
    private activatedRoute: ActivatedRoute,
    public authSrv: BamboAuthService,
    public location: Location) {
    super(store, employeSrv);
    this.pageData = {
      title: 'Dossier - Employé',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Employés',
          route: '/'+this.orientation+'/employe'
        },
        {
          title: 'Affichage'
        }
      ]
    };
    
  
   
    
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findEntity(this.activatedRoute.snapshot.params.id);
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.title = this.entity?.prenoms+' '+this.entity?.nom+' ('+this.entity?.matricule+')';
    this.findLatestFonction();
  }

  handlePostDelete() {
    this.location.back();
  }

  findLatestFonction() {
    this
    .fonctionEmployeSrv
    .findLatest(this.entity)
    .pipe(first())
    .subscribe((fonctionEmploye: any) => {
      this.latestFonction = fonctionEmploye;
    }, err => {
      this.fonctionEmployeSrv.httpSrv.handleError(err);
    })
  }
  updateProfile(form: FormGroup) {
    if (form.valid) {
      this.update();
    }
  }
  onFileChanged(inputValue: any) {
    let file: File = inputValue.target.files[0];
    let reader: FileReader = new FileReader();
    reader.onloadend = () => {
      this.currentAvatar = reader.result;
      this.employeSrv.uploadPhoto(this.currentAvatar.split(',')[1], file.name.split('.')[0])
        .subscribe(
          (user: any) => {
            this.employeSrv.toastr.success('Photo de profil mise à jour !')
          },
          error => this.employeSrv.httpSrv.catchError(error))
    };
    reader.readAsDataURL(file);
  }

}
