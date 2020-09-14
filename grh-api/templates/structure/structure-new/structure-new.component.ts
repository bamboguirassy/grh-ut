import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { StructureService } from '../structure.service';
import { Structure } from '../structure';
import { Router } from '@angular/router';

@Component({
  selector: 'app-structure-new',
  templateUrl: './structure-new.component.html',
  styleUrls: ['./structure-new.component.scss']
})
export class StructureNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Structure;
  @Output() creation: EventEmitter<Structure> = new EventEmitter();
  isModalVisible = false;

  constructor(public structureSrv: StructureService,
    public router: Router) {
    this.entity = new Structure();
  }

  ngOnInit(): void {}

  save() {
    this.structureSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Structure();
      }, error => this.structureSrv.httpSrv.catchError(error));
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

