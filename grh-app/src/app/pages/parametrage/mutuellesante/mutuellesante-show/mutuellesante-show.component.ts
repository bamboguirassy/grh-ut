import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { MutuelleSanteService } from '../mutuellesante.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { MutuelleSante } from '../mutuellesante';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-mutuellesante-show',
  templateUrl: './mutuellesante-show.component.html',
  styleUrls: ['./mutuellesante-show.component.scss']
})
export class MutuelleSanteShowComponent extends BasePageComponent<MutuelleSante> implements OnInit, OnDestroy {
  entity: MutuelleSante;
  titre='Informations';
  MembresMutuelleSante: MutuelleSante[] = [];
  selectedIndex = 0;
  currentAvatar: any;
  constructor(store: Store<IAppState>,
    public mutuelleSanteSrv: MutuelleSanteService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, mutuelleSanteSrv);
    this.pageData = {
      title: 'Détails - MutuelleSante',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'MutuelleSante',
          route: '/'+this.orientation+'/mutuellesante'
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
    this.title = 'MutuelleSante - ' + this.entity?.nom;
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
      this.mutuelleSanteSrv.uploadPhoto(this.entity, this.currentAvatar.split(',')[1], file.name.split('.')[0])
        .subscribe(
          (data: any) => {
            this.entity = data;
            this.handlePostLoad();
            this.mutuelleSanteSrv.toastr.success('Photo mise à jour !')
          },
          error => this.mutuelleSanteSrv.httpSrv.catchError(error))
    };
    reader.readAsDataURL(file);
  }
  
}
