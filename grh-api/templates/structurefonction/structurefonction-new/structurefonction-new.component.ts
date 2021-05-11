import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { StructureFonctionService } from '../structurefonction.service';
import { StructureFonction } from '../structurefonction';
import { Router } from '@angular/router';

@Component({
  selector: 'app-structurefonction-new',
  templateUrl: './structurefonction-new.component.html',
  styleUrls: ['./structurefonction-new.component.scss']
})
export class StructureFonctionNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: StructureFonction;
  @Output() creation: EventEmitter<StructureFonction> = new EventEmitter();
  isModalVisible = false;

  constructor(public structureFonctionSrv: StructureFonctionService,
    public router: Router) {
    this.entity = new StructureFonction();
  }

  ngOnInit(): void {}

  save() {
    this.structureFonctionSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new StructureFonction();
      }, error => this.structureFonctionSrv.httpSrv.catchError(error));
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

