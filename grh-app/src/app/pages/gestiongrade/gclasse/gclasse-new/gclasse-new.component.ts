import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { GClasseService } from '../gclasse.service';
import { GClasse } from '../gclasse';
import { Router } from '@angular/router';

@Component({
  selector: 'app-gclasse-new',
  templateUrl: './gclasse-new.component.html',
  styleUrls: ['./gclasse-new.component.scss']
})
export class GClasseNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: GClasse;
  @Output() creation: EventEmitter<GClasse> = new EventEmitter();
  isModalVisible = false;

  constructor(public gClasseSrv: GClasseService,
    public router: Router) {
    this.entity = new GClasse();
  }

  ngOnInit(): void {}

  save() {
    this.gClasseSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new GClasse();
      }, error => this.gClasseSrv.httpSrv.catchError(error));
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

