import { Component, OnInit, OnDestroy, ViewChild, ElementRef, ViewChildren, Output, EventEmitter, Input } from '@angular/core';
import { MembreCommission } from '../membrecommission';
import { MembreCommissionService } from '../membrecommission.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { DatePipe, Location } from '@angular/common';
import { Commission } from 'src/app/pages/parametrage/commission/commission';
import { CommissionService } from 'src/app/pages/parametrage/commission/commission.service';

@Component({
  selector: 'app-membrecommission-edit',
  templateUrl: './membrecommission-edit.component.html',
  styleUrls: ['./membrecommission-edit.component.scss']
})
export class MembreCommissionEditComponent implements OnInit, OnDestroy {
  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: MembreCommission
  @Output() modification: EventEmitter<MembreCommission> = new EventEmitter();
  @Output() onClose: EventEmitter<any> = new EventEmitter();
  isModalVisible = false;
  commissions: Commission[] = [];
  selectedCommissionId: any;
  @Input() set selectedMembreCommission(value) {
    this.entity = value;
    this.selectedCommissionId = this.entity.commission.id;
    this.openModal();
  };

  constructor(store: Store<IAppState>,
    public membreCommissionSrv: MembreCommissionService,
    public router: Router,
    private activatedRoute: ActivatedRoute,
    public location: Location, public datePipe: DatePipe,
    public commissionSrv: CommissionService) {

  }

  ngOnInit(): void {
    this.findCommissions();
  }

  ngOnDestroy() {
  }

  handlePostLoad() {
  }
  
  prepareUpdate() {
    this.entity.commission = this.selectedCommissionId;
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
  }
  update() {
    this.prepareUpdate();
    this.membreCommissionSrv.update(this.entity)
      .subscribe((resp: any) => {
        this.closeModal();
        this.modification.emit(resp);
      }, (err) => {
        this.membreCommissionSrv.httpSrv.catchError(err);
      });
  }
  handlePostUpdate() {
    this.location.back();
  }
  // open modal window
  openModal() {
    this.isModalVisible = true;
  }

  // close modal window
  closeModal() {
    this.onClose.emit();
    this.isModalVisible = false;
  }

  findCommissions() {
    return this.commissionSrv.findAll()
      .subscribe((data: any) => {
        this.commissions = data;
      }, err => this.commissionSrv.httpSrv.catchError(err));
  }
}
