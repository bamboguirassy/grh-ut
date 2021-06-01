import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren, Input } from '@angular/core';
import { MembreCommissionService } from '../membrecommission.service';
import { MembreCommission } from '../membrecommission';
import { Router } from '@angular/router';
import { Employe } from '../../employe/employe';
import { EmployeService } from '../../employe/employe.service';
import { DatePipe } from '@angular/common';
import { Commission } from 'src/app/pages/parametrage/commission/commission';
import { CommissionService } from 'src/app/pages/parametrage/commission/commission.service';

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
  @Input() employe: Employe;
  commissions: Commission[] = [];
  selectedCommission: any;



  constructor(public membreCommissionSrv: MembreCommissionService,
    public employeSrv: EmployeService,
    public commissionSrv: CommissionService, public datePipe: DatePipe,
    public router: Router) {
      this.initNewMembreCommission();
  }

  ngOnInit(): void {
  }

  save() {
    this.entity.employe = this.employe.id;
    if (this.entity.dateIntegration) {
      this.entity.dateIntegration = this.datePipe.transform(this.entity.dateIntegration, 'yyyy-MM-dd');
    }
    if (this.entity.dateSortie) {
      this.entity.dateSortie = this.datePipe.transform(this.entity.dateSortie, 'yyyy-MM-dd');
    }
    if (this.entity.statut) {
      this.entity.motifSortie = null;
      this.entity.dateSortie = null;
    }
    if (this.selectedCommission) {
      this.entity.commission = this.selectedCommission.id;
    }
    this.membreCommissionSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.selectedCommission = null;
        this.initNewMembreCommission();
      }, error => this.membreCommissionSrv.httpSrv.catchError(error));
  }
  initNewMembreCommission() {
    this.entity = new MembreCommission();
    this.entity.statut = true;
  }

  // open modal window
  openModal() {
    this.isModalVisible = true;
    this.findCommissions();

  }

  // close modal window
  closeModal() {
    this.isModalVisible = false;
  }
  findCommissions() {
    this.commissionSrv.findAll()
      .subscribe((data: any) => {
        this.commissions = data;
      }, err => this.commissionSrv.httpSrv.catchError(err));
  }


}

