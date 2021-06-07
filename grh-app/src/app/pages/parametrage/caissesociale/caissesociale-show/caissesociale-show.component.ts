import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { CaisseSocialeService } from '../caissesociale.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { CaisseSociale } from '../caissesociale';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-caissesociale-show',
  templateUrl: './caissesociale-show.component.html',
  styleUrls: ['./caissesociale-show.component.scss']
})
export class CaisseSocialeShowComponent extends BasePageComponent<CaisseSociale> implements OnInit, OnDestroy {
  entity: CaisseSociale;
  currentAvatar: any;
  constructor(store: Store<IAppState>,
    public caisseSocialeSrv: CaisseSocialeService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, caisseSocialeSrv);
    this.pageData = {
      title: 'Détails - Caisse Sociale',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Caisse Sociales',
          route: '/'+this.orientation+'/caissesociale'
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
    this.title = 'Caisse Sociale ' + this.entity?.code;
  }

  handlePostDelete() {
    this.location.back();
  }

  onFileChanged(inputValue: any) {
    let file: File = inputValue.target.files[0];
    let reader: FileReader = new FileReader();
    reader.onloadend = () => {
      this.currentAvatar = reader.result;
      this.caisseSocialeSrv.uploadPhoto(this.entity, this.currentAvatar.split(',')[1], file.name.split('.')[0])
        .subscribe(
          (data: any) => {
            this.entity = data;
            this.handlePostLoad();
            this.caisseSocialeSrv.toastr.success('Photo mise à jour !')
          },
          error => this.caisseSocialeSrv.httpSrv.catchError(error))
    };
    reader.readAsDataURL(file);
  }

}
