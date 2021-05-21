import { Employe } from './../../employe/employe';
import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren, Input } from '@angular/core';
import { AdresseService } from '../adresse.service';
import { Adresse } from '../adresse';
import { Router } from '@angular/router';

@Component({
  selector: 'app-adresse-new',
  templateUrl: './adresse-new.component.html',
  styleUrls: ['./adresse-new.component.scss']
})
export class AdresseNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Adresse;
  @Output() creation: EventEmitter<Adresse> = new EventEmitter();
  isModalVisible = false;
  @Input() employe: Employe;

  constructor(public adresseSrv: AdresseService,
    public router: Router) {
    this.entity = new Adresse();
    this.entity.etat= true;
  }

  ngOnInit(): void {}

  save() {
    this.entity.employe = this.employe.id;
    this.adresseSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Adresse();
        this.entity.etat = true;
      }, error => this.adresseSrv.httpSrv.catchError(error));
  }

  // open modal window
  openModal() {
    this.isModalVisible = true;
  }

  // close modal window
  closeModal() {
    this.isModalVisible = false;
  }

}

