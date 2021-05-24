import { Component, OnInit, OnDestroy, ViewChild, ElementRef, ViewChildren, Output, EventEmitter } from '@angular/core';
import { GClasse } from '../gclasse';
import { GClasseService } from '../gclasse.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';
import { Profession } from 'src/app/pages/parametrage/profession/profession';
import { UploadFileModel } from 'src/app/shared/classes/upload-file-model';
import { TypeEmploye } from 'src/app/pages/parametrage/typeemploye/typeemploye';
import { TypeEmployeService } from 'src/app/pages/parametrage/typeemploye/typeemploye.service';

@Component({
  selector: 'app-gclasse-edit',
  templateUrl: './gclasse-edit.component.html',
  styleUrls: ['./gclasse-edit.component.scss']
})
export class GClasseEditComponent extends BasePageComponent<GClasse> implements OnInit, OnDestroy {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: GClasse;
  @Output() creation: EventEmitter<Profession> = new EventEmitter();
  isModalVisible = false;
  currentAvatar: any;
  fileModel: UploadFileModel = new UploadFileModel();

  classes: GClasse[] = [];
  selectedClasseId: any;

  constructor(store: Store<IAppState>,
    public gClasseSrv: GClasseService,
    public typeEmployeSrv: TypeEmployeService,
    public router: Router,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, gClasseSrv);
    this.pageData = {
      title: 'Modification - Classe',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des classes',
          route: '/' + this.orientation + '/gclasse'
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
    this.selectedClasseId = this.entity.suivant?.id;
    this.findClasses();
  }

  prepareUpdate() {
    this.entity.suivant = this.selectedClasseId;
  }

  handlePostUpdate() {
    this.location.back();
  }

  findClasses() {
    this.gClasseSrv.findByTypeEmploye(this.entity.typeEmploye)
      .subscribe((data: any) => {
        this.classes = data;
        if(this.entity.suivant) {
          this.classes.unshift(this.entity.suivant);
        }
      }, err => this.gClasseSrv.httpSrv.catchError(err));
  }

 

}
