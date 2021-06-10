import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { SyndicatService } from '../syndicat.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { Syndicat } from '../syndicat';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-syndicat-show',
  templateUrl: './syndicat-show.component.html',
  styleUrls: ['./syndicat-show.component.scss']
})
export class SyndicatShowComponent extends BasePageComponent<Syndicat> implements OnInit, OnDestroy {
  entity:Syndicat;

  currentAvatar: any;

  constructor(store: Store<IAppState>,
    public syndicatSrv: SyndicatService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, syndicatSrv);
    this.pageData = {
      title: 'Détails - Syndicat/Amicale',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Partenaires Sociaux',
          route: '/'+this.orientation+'/syndicat'
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
    this.title = 'Partenaire Social - ' + this.entity?.code;
  }

  handlePostDelete() {
    this.location.back();
  }
  // upload new file
  onFileChanged(inputValue: any) {
    let file: File = inputValue.target.files[0];
    let reader: FileReader = new FileReader();
    reader.onloadend = () => {
      this.currentAvatar = reader.result;
      this.syndicatSrv.uploadPhoto(this.entity, this.currentAvatar.split(',')[1], file.name.split('.')[0])
        .subscribe(
          (data: any) => {
            this.entity = data;
            this.handlePostLoad();
            this.syndicatSrv.toastr.success('Photo mise à jour !')
          },
          error => this.syndicatSrv.httpSrv.catchError(error))
    };
    reader.readAsDataURL(file);
  }

}
