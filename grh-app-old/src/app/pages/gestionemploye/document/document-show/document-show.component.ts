import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { DocumentService } from '../document.service';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { Document } from '../document';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'app-document-show',
  templateUrl: './document-show.component.html',
  styleUrls: ['./document-show.component.scss']
})
export class DocumentShowComponent extends BasePageComponent<Document> implements OnInit, OnDestroy {
  entity: Document;

  constructor(store: Store<IAppState>,
    public documentSrv: DocumentService,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, documentSrv);
    this.pageData = {
      title: 'Détails - Document',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Documents',
          route: '/'+this.orientation+'/document'
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
    this.title = 'Document - ' + this.entity?.id;
  }

  handlePostDelete() {
    this.location.back();
  }

}
