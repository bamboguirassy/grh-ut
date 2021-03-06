import { Component, OnInit, OnDestroy } from '@angular/core';
import { TypeDocument } from '../typedocument';
import { TypeDocumentService } from '../typedocument.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';
import * as ClassicEditor from '@ckeditor/ckeditor5-build-classic';

@Component({
  selector: 'app-typedocument-edit',
  templateUrl: './typedocument-edit.component.html',
  styleUrls: ['./typedocument-edit.component.scss']
})
export class TypeDocumentEditComponent extends BasePageComponent<TypeDocument> implements OnInit, OnDestroy {
  editor = ClassicEditor;

  constructor(store: Store<IAppState>,
              public typeDocumentSrv: TypeDocumentService,
              public router: Router,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
    super(store, typeDocumentSrv);
    this.pageData = {
      title: 'Modification - Type Document',
      breadcrumbs: [
        {
          title: 'Accueil ',
          route: ''
        },
        {
          title: 'Types Document ',
          route: '/'+this.orientation+'/typedocument'
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
