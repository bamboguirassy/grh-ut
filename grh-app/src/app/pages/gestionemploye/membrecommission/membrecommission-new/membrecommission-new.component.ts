import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { MembreCommissionService } from '../membrecommission.service';
import { MembreCommission } from '../membrecommission';
import { Router } from '@angular/router';

@Component({
  selector: 'app-membrecommission-new',
  templateUrl: './membrecommission-new.component.html',
  styleUrls: ['./membrecommission-new.component.scss']
})
export class MembreCommissionNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: MembreCommission;
  @Output() creation: EventEmitter<MembreCommission> = new EventEmitter();
  isModalVisible = false;

  constructor(public membreCommissionSrv: MembreCommissionService,
    public router: Router) {
    this.entity = new MembreCommission();
  }

  ngOnInit(): void {}

  save() {
    this.membreCommissionSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new MembreCommission();
      }, error => this.membreCommissionSrv.httpSrv.catchError(error));
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

