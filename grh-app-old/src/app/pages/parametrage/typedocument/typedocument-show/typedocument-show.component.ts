import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { TypeDocumentService } from '../typedocument.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { TypeDocument } from '../typedocument';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-typedocument-show',
  templateUrl: './typedocument-show.component.html',
  styleUrls: ['./typedocument-show.component.scss']
})
export class TypeDocumentShowComponent extends BasePageComponent<TypeDocument> implements OnInit, OnDestroy {
  entity: TypeDocument;

  constructor(store: Store<IAppState>,
    public typeDocumentSrv: TypeDocumentService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, typeDocumentSrv);
    this.pageData = {
      title: 'Détails - TypeDocument',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'TypeDocuments',
          route: '/'+this.orientation+'/typedocument'
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
    this.title = 'TypeDocument - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
