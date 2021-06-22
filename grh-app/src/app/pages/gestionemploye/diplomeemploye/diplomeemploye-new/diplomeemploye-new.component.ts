import { DiplomeService } from './../../../parametrage/diplome/diplome.service';
import { Diplome } from './../../../parametrage/diplome/diplome';
import { Employe } from './../../employe/employe';
import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren, Input } from '@angular/core';
import { DiplomeEmployeService } from '../diplomeemploye.service';
import { DiplomeEmploye } from '../diplomeemploye';
import { Router } from '@angular/router';
import { IOption } from 'src/app/ui/interfaces/option';

@Component({
  selector: 'app-diplomeemploye-new',
  templateUrl: './diplomeemploye-new.component.html',
  styleUrls: ['./diplomeemploye-new.component.scss']
})
export class DiplomeEmployeNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: DiplomeEmploye;
  @Input() employe: Employe
  @Output() creation: EventEmitter<DiplomeEmploye> = new EventEmitter();
  isModalVisible = false;
  selectedDiplome: Diplome;
  diplomes: Diplome[] = [];
  statutFormations: IOption[] = [];

  constructor(public diplomeEmployeSrv: DiplomeEmployeService,
    public router: Router, public diplomeServ: DiplomeService) {
    this.entity = new DiplomeEmploye();
    diplomeEmployeSrv.statutFormations.forEach(statut => {
      this.statutFormations.push({value: statut.label, label: statut.label, color: statut.color});
    });
  }

  ngOnInit(): void {
    this.findDiplomes();
  }

  save() {
    this.entity.diplome = this.selectedDiplome.id;
    this.entity.employe = this.employe.id;
    if (this.entity.statutFormation=='En cours') {
      this.entity.anneeObtention='- - -';
    }  
    this.diplomeEmployeSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.selectedDiplome = null;
        this.entity = new DiplomeEmploye();
      }, error => this.diplomeEmployeSrv.httpSrv.catchError(error));
  }

  // open modal window
  openModal() {
    this.isModalVisible = true;
  }

  // close modal window
  closeModal() {
    this.isModalVisible = false;
  }

  findDiplomes() {
    this.diplomeServ.findAll()
      .subscribe((data: any) => {
        this.diplomes = data;
      }, err => this.diplomeServ.httpSrv.catchError(err));
  }

}

