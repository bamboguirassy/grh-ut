import { Component, OnInit, OnDestroy, ViewChild, ElementRef, ViewChildren, Output, EventEmitter } from '@angular/core';
import { Profession } from '../profession';
import { ProfessionService } from '../profession.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';
import { UploadFileModel } from 'src/app/shared/classes/upload-file-model';
import { GClasse } from 'src/app/pages/gestiongrade/gclasse/gclasse';
import { GClasseService } from 'src/app/pages/gestiongrade/gclasse/gclasse.service';

@Component({
  selector: 'app-profession-edit',
  templateUrl: './profession-edit.component.html',
  styleUrls: ['./profession-edit.component.scss']
})
export class ProfessionEditComponent extends BasePageComponent<Profession> implements OnInit, OnDestroy {
  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Profession;
  @Output() creation: EventEmitter<Profession> = new EventEmitter();
  isModalVisible = false;
  currentAvatar: any;
  fileModel: UploadFileModel = new UploadFileModel();

  classes: GClasse[] = [];
  selectedClasseId: any;

  constructor(store: Store<IAppState>,
    public professionSrv: ProfessionService,
    public gClasseService: GClasseService,
    public router: Router,
    private activatedRoute: ActivatedRoute,
    public location: Location) {
    super(store, professionSrv);
    this.pageData = {
      title: 'Modification - Profession',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des professions',
          route: '/' + this.orientation + '/profession'
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
    this.selectedClasseId = this.entity.classe?.id;
    this.findClasses();
  }

  prepareUpdate() {
    this.entity.classe = this.selectedClasseId;
  }

  handlePostUpdate() {
    this.location.back();

  }
  findClasses() {
    this.gClasseService.findAll()
      .subscribe((data: any) => {
        this.classes = data;
      }, err => this.gClasseService.httpSrv.catchError(err));
  }

}
