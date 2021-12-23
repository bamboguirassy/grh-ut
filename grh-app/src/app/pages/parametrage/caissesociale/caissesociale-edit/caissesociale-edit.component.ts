import { Component, OnInit, OnDestroy } from '@angular/core';
import { CaisseSociale } from '../caissesociale';
import { CaisseSocialeService } from '../caissesociale.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-caissesociale-edit',
  templateUrl: './caissesociale-edit.component.html',
  styleUrls: ['./caissesociale-edit.component.scss']
})
export class CaisseSocialeEditComponent extends BasePageComponent<CaisseSociale> implements OnInit, OnDestroy {
  caissesocialeavatar: any;
  constructor(store: Store<IAppState>,
              public caisseSocialeSrv: CaisseSocialeService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, caisseSocialeSrv);
    this.pageData = {
      title: 'Modification - Caisse Sociale',
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
          title: 'Modification'
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
  }

  prepareUpdate() {
  }

  handlePostUpdate() {
    this.location.back();
  }

  // upload new file
  onFileChanged(inputValue: any) {
    let file: File = inputValue.target.files[0];
    let reader: FileReader = new FileReader();
    reader.onloadend = () => {
      this.caissesocialeavatar = reader.result;
      this.caisseSocialeSrv.uploadPhoto(this.entity, this.caissesocialeavatar.split(',')[1], file.name.split('.')[0])
        .subscribe(
          (user: any) => {
            this.findEntity(this.activatedRoute.snapshot.params.id);
            this.caisseSocialeSrv.toastr.success('Photo mise à jour !')
          },
          error => this.caisseSocialeSrv.httpSrv.catchError(error))
    };
    reader.readAsDataURL(file);
  }

}
