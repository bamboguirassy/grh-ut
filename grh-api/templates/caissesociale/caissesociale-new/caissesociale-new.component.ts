import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { CaisseSocialeService } from '../caissesociale.service';
import { CaisseSociale } from '../caissesociale';
import { Router } from '@angular/router';

@Component({
  selector: 'app-caissesociale-new',
  templateUrl: './caissesociale-new.component.html',
  styleUrls: ['./caissesociale-new.component.scss']
})
export class CaisseSocialeNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: CaisseSociale;
  @Output() creation: EventEmitter<CaisseSociale> = new EventEmitter();
  isModalVisible = false;

  constructor(public caisseSocialeSrv: CaisseSocialeService,
    public router: Router) {
    this.entity = new CaisseSociale();
  }

  ngOnInit(): void {}

  save() {
    this.caisseSocialeSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new CaisseSociale();
      }, error => this.caisseSocialeSrv.httpSrv.catchError(error));
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

