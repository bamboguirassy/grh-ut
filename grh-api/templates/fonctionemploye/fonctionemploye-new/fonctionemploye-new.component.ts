import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { FonctionEmployeService } from '../fonctionemploye.service';
import { FonctionEmploye } from '../fonctionemploye';
import { Router } from '@angular/router';

@Component({
  selector: 'app-fonctionemploye-new',
  templateUrl: './fonctionemploye-new.component.html',
  styleUrls: ['./fonctionemploye-new.component.scss']
})
export class FonctionEmployeNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: FonctionEmploye;
  @Output() creation: EventEmitter<FonctionEmploye> = new EventEmitter();
  isModalVisible = false;

  constructor(public fonctionEmployeSrv: FonctionEmployeService,
    public router: Router) {
    this.entity = new FonctionEmploye();
  }

  ngOnInit(): void {}

  save() {
    this.fonctionEmployeSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new FonctionEmploye();
      }, error => this.fonctionEmployeSrv.httpSrv.catchError(error));
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

