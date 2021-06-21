import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { TypeDocumentService } from '../typedocument.service';
import { TypeDocument } from '../typedocument';

@Component({
  selector: 'app-typedocument-list',
  templateUrl: './typedocument-list.component.html',
  styleUrls: ['./typedocument-list.component.scss']
})
export class TypeDocumentListComponent extends BasePageComponent<TypeDocument> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
              public typeDocumentSrv: TypeDocumentService) {
    super(store, typeDocumentSrv);

    this.pageData = {
      title: 'Liste des Types de Document',
      breadcrumbs: [
        {
          title: 'Accueil ',
          route: ''
        },
        {
          title: 'Liste des types de document'
        }
      ]
    };
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findAll();
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostDelete() {
    this.findAll();
  }

  handlePostLoad(){}

  enabledEdit(item) {
    item.editEnabled = true;
  }

  disableEdit(item) {
    item.editEnabled = false;
  }

  updateDureeArchivage(item) {
    this.typeDocumentSrv.update(item)
      .subscribe(() => {
        item.editEnabled = false;
      }, err => this.typeDocumentSrv.httpSrv.catchError(err));
  }

}
