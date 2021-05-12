import { Component, OnInit, OnDestroy } from '@angular/core';
import { Document } from '../document';
import { DocumentService } from '../document.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-document-edit',
  templateUrl: './document-edit.component.html',
  styleUrls: ['./document-edit.component.scss']
})
export class DocumentEditComponent extends BasePageComponent<Document> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public documentSrv: DocumentService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, documentSrv);
    this.pageData = {
      title: 'Modification - Document',
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

}
