import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { DocumentService } from '../document.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { Document } from '../document';

@Component({
  selector: 'app-document-clone',
  templateUrl: './document-clone.component.html',
  styleUrls: ['./document-clone.component.scss']
})
export class DocumentCloneComponent extends BasePageComponent<Document> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public documentSrv: DocumentService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, documentSrv);
    this.pageData = {
      title: 'Clonage - Document',
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
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.documentSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: Document) {
    this.documentSrv.httpSrv.router.navigate([this.orientation,this.documentSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

