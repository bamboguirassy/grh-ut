import { IOption } from './../../../../ui/interfaces/option';
import { DiplomeService } from './../../../parametrage/diplome/diplome.service';
import { Diplome } from './../../../parametrage/diplome/diplome';
import { Component, OnInit, OnDestroy, Output, EventEmitter, Input, ViewChild, ElementRef } from '@angular/core';
import { DiplomeEmploye } from '../diplomeemploye';
import { DiplomeEmployeService } from '../diplomeemploye.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { Location } from '@angular/common';

@Component({
  selector: 'app-diplomeemploye-edit',
  templateUrl: './diplomeemploye-edit.component.html',
  styleUrls: ['./diplomeemploye-edit.component.scss']
})
export class DiplomeEmployeEditComponent implements OnInit, OnDestroy {
  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  isModalVisible = false;
  entity: DiplomeEmploye;
  @Output() modification: EventEmitter<DiplomeEmploye> = new EventEmitter();
  @Output() onClose: EventEmitter<any> = new EventEmitter();
  diplomes: Diplome[] = [];
  statutFormations: IOption[] = [];
  @Input() set selectedDiplome(value){
    this.entity = value;
    this.handlePostLoad();
    this.openModal();
  }
  selectedDiplomeId: any;
  
  constructor(store: Store<IAppState>,
              public diplomeEmployeSrv: DiplomeEmployeService,
              public router: Router, public diplomeServ: DiplomeService,
              private activatedRoute: ActivatedRoute,
              public location: Location) {
                diplomeEmployeSrv.statutFormations.forEach(statut => {
                  this.statutFormations.push({value: statut.label, label: statut.label, color: statut.color});
                });
  }

  ngOnDestroy(): void {

  }
  ngOnInit(): void {
    this.findDiplomes();
  }

  handlePostLoad() {
    this.selectedDiplomeId = this.entity?.diplome.id;
    
  }

  handlePostUpdate() {
    this.location.back();
  }

   // open modal window
   openModal() {
    this.isModalVisible = true;
  }

  // close modal window
  closeModal() {
    this.onClose.emit();
    this.isModalVisible = false;
  }

  update() {
    this.entity.diplome = this.selectedDiplomeId;
    this.diplomeEmployeSrv.update(this.entity)
      .subscribe((resp: any) => {
        this.closeModal();
        this.modification.emit(resp);
      },(err)=>{
        this.diplomeEmployeSrv.httpSrv.catchError(err);
      });
  }

  findDiplomes() {
    return this.diplomeServ.findAll()
      .subscribe((data: any) => {
        this.diplomes = data;
      }, err => this.diplomeServ.httpSrv.catchError(err));
  }
}
