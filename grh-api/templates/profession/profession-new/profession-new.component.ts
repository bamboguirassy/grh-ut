import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { ProfessionService } from '../profession.service';
import { Profession } from '../profession';
import { Router } from '@angular/router';

@Component({
  selector: 'app-profession-new',
  templateUrl: './profession-new.component.html',
  styleUrls: ['./profession-new.component.scss']
})
export class ProfessionNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: Profession;
  @Output() creation: EventEmitter<Profession> = new EventEmitter();
  isModalVisible = false;

  constructor(public professionSrv: ProfessionService,
    public router: Router) {
    this.entity = new Profession();
  }

  ngOnInit(): void {}

  save() {
    this.professionSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new Profession();
      }, error => this.professionSrv.httpSrv.catchError(error));
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

