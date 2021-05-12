import { Component, OnInit, OnDestroy } from '@angular/core';
import { GCategorie } from '../gcategorie';
import { GCategorieService } from '../gcategorie.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-gcategorie-edit',
  templateUrl: './gcategorie-edit.component.html',
  styleUrls: ['./gcategorie-edit.component.scss']
})
export class GCategorieEditComponent extends BasePageComponent<GCategorie> implements OnInit, OnDestroy {

  
  categories: GCategorie[] = [];
  selectedCategorieId: any;

  constructor(store: Store<IAppState>,
    public gCategorieSrv: GCategorieService,
    public router: Router,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, gCategorieSrv);
    this.pageData = {
      title: 'Modification - catégorie',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des catégories',
          route: '/' + this.orientation + '/gcategorie'
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
    this.selectedCategorieId = this.entity.suivant?.id;
    this.findCategories();
  }

  prepareUpdate() {
    this.entity.suivant = this.selectedCategorieId;
  }

  handlePostUpdate() {
    this.location.back();
  }

  findCategories() {
    this.gCategorieSrv.findNonSuivants()
    .subscribe((data: any)=>{
      this.categories = data;
      if(this.entity.suivant) {
        this.categories.unshift(this.entity.suivant);
      }
    }, err =>this.gCategorieSrv.httpSrv.catchError(err));
  }

}
