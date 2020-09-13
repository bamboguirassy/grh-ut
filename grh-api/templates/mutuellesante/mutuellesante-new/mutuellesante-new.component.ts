import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { MutuelleSanteService } from '../mutuellesante.service';
import { MutuelleSante } from '../mutuellesante';
import { Router } from '@angular/router';

@Component({
  selector: 'app-mutuellesante-new',
  templateUrl: './mutuellesante-new.component.html',
  styleUrls: ['./mutuellesante-new.component.scss']
})
export class MutuelleSanteNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: MutuelleSante;
  @Output() creation: EventEmitter<MutuelleSante> = new EventEmitter();
  isModalVisible = false;

  constructor(public mutuelleSanteSrv: MutuelleSanteService,
    public router: Router) {
    this.entity = new MutuelleSante();
  }

  ngOnInit(): void {}

  save() {
    this.mutuelleSanteSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new MutuelleSante();
      }, error => this.mutuelleSanteSrv.httpSrv.catchError(error));
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

