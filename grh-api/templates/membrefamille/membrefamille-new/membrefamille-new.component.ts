import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { MembreFamilleService } from '../membrefamille.service';
import { MembreFamille } from '../membrefamille';
import { Router } from '@angular/router';

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

  constructor(public membreFamilleSrv: MembreFamilleService,
    public router: Router) {
    this.entity = new MembreFamille();
  }

  ngOnInit(): void {}

  save() {
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

