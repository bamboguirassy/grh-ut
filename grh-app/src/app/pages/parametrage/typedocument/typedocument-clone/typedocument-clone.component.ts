import { Component, OnInit, OnDestroy } from '@angular/core';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { TypeDocumentService } from '../typedocument.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { TypeDocument } from '../typedocument';

@Component({
  selector: 'app-typedocument-clone',
  templateUrl: './typedocument-clone.component.html',
  styleUrls: ['./typedocument-clone.component.scss']
})
export class TypeDocumentCloneComponent extends BasePageComponent<TypeDocument> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public typeDocumentSrv: TypeDocumentService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, typeDocumentSrv);
    this.pageData = {
      title: 'Clonage - TypeDocument',
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
          title: 'Clonage'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.getData(this.typeDocumentSrv.getRoutePrefix() + this.activatedRoute.snapshot.params.id, 'original', 'setLoaded');
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostLoad() {
    this.entity = Object.assign({}, this.original);
    this.entity.id = null;
  }

  handlePostClone(data: TypeDocument) {
    this.typeDocumentSrv.httpSrv.router.navigate([this.orientation,this.typeDocumentSrv.getRoutePrefixWithoutSlash(),data.id]);
  }

  prepareClone() {}

}

