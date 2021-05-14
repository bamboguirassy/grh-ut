import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { FonctionService } from '../fonction.service';
import { Fonction } from '../fonction';
import { Router } from '@angular/router';

@Component({
  selector: 'app-fonction-new',
  templateUrl: './fonction-new.component.html',
  styleUrls: ['./fonction-new.component.scss']
})
export class FonctionNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Fonction;
  @Output() creation: EventEmitter<Fonction> = new EventEmitter();
  isModalVisible = false;

  constructor(public fonctionSrv: FonctionService,
    public router: Router) {
    this.entity = new Fonction();
  }

  ngOnInit(): void {}

  save() {
    this.fonctionSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Fonction();
      }, error => this.fonctionSrv.httpSrv.catchError(error));
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

