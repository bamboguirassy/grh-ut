import { Employe } from './../../employe/employe';
import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren, Input } from '@angular/core';
import { MembreFamilleService } from '../membrefamille.service';
import { MembreFamille } from '../membrefamille';
import { Router } from '@angular/router';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-membrefamille-new',
  templateUrl: './membrefamille-new.component.html',
  styleUrls: ['./membrefamille-new.component.scss']
})
export class MembreFamilleNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: MembreFamille;
  @Output() creation: EventEmitter<MembreFamille> = new EventEmitter();
  isModalVisible = false;
  @Input() employe: Employe;

  constructor(public membreFamilleSrv: MembreFamilleService,
    public router: Router, public datePipe: DatePipe) {
    this.entity = new MembreFamille();
  }

  ngOnInit(): void {}

  save() {
    this.entity.employe = this.employe.id;
    this.entity.dateNaissance = this.datePipe.transform(this.entity.dateNaissance,'yyyy-MM-dd');
    this.membreFamilleSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new MembreFamille();
      }, error => this.membreFamilleSrv.httpSrv.catchError(error));
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

