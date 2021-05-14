import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { ContratService } from '../contrat.service';
import { Contrat } from '../contrat';
import { Router } from '@angular/router';

@Component({
  selector: 'app-contrat-new',
  templateUrl: './contrat-new.component.html',
  styleUrls: ['./contrat-new.component.scss']
})
export class ContratNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Contrat;
  @Output() creation: EventEmitter<Contrat> = new EventEmitter();
  isModalVisible = false;

  constructor(public contratSrv: ContratService,
    public router: Router) {
    this.entity = new Contrat();
  }

  ngOnInit(): void {}

  save() {
    this.contratSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Contrat();
      }, error => this.contratSrv.httpSrv.catchError(error));
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

