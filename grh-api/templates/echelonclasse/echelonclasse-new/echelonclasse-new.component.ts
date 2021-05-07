import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { EchelonClasseService } from '../echelonclasse.service';
import { EchelonClasse } from '../echelonclasse';
import { Router } from '@angular/router';

@Component({
  selector: 'app-echelonclasse-new',
  templateUrl: './echelonclasse-new.component.html',
  styleUrls: ['./echelonclasse-new.component.scss']
})
export class EchelonClasseNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: EchelonClasse;
  @Output() creation: EventEmitter<EchelonClasse> = new EventEmitter();
  isModalVisible = false;

  constructor(public echelonClasseSrv: EchelonClasseService,
    public router: Router) {
    this.entity = new EchelonClasse();
  }

  ngOnInit(): void {}

  save() {
    this.echelonClasseSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new EchelonClasse();
      }, error => this.echelonClasseSrv.httpSrv.catchError(error));
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

