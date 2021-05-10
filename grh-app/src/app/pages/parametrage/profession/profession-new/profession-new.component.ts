import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { ProfessionService } from '../profession.service';
import { Profession } from '../profession';
import { Router } from '@angular/router';
import { GClasse } from 'src/app/pages/gestiongrade/gclasse/gclasse';
import { GClasseService } from 'src/app/pages/gestiongrade/gclasse/gclasse.service';
import { ClassElement } from 'typescript';

@Component({
  selector: 'app-profession-new',
  templateUrl: './profession-new.component.html',
  styleUrls: ['./profession-new.component.scss']
})
export class ProfessionNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Profession;
  @Output() creation: EventEmitter<Profession> = new EventEmitter();
  isModalVisible = false;

  classes: GClasse[] = [];
  selectedClasse: GClasse;


  constructor(public professionSrv: ProfessionService,
    public router: Router,
    public gClasseService: GClasseService,) {
    this.entity = new Profession();

  }

  ngOnInit(): void {
    this.findClasses();
  }

  save() {
    if (this.selectedClasse) {
      this.entity.classe = this.selectedClasse.id;
    }
    this.professionSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Profession();
      }, error => this.professionSrv.httpSrv.catchError(error));
  }

  // open modal window
  openModal() {
    this.isModalVisible = true;
  }

  // close modal window
  closeModal() {
    this.isModalVisible = false;
  }
  
  findClasses() {
    this.gClasseService.findAll()
      .subscribe((data: any) => {
        this.classes = data;
      }, err => this.gClasseService.httpSrv.catchError(err));
  }

}

