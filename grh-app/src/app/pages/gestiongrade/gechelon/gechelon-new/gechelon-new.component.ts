import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { GEchelonService } from '../gechelon.service';
import { GEchelon } from '../gechelon';
import { Router } from '@angular/router';

@Component({
  selector: 'app-gechelon-new',
  templateUrl: './gechelon-new.component.html',
  styleUrls: ['./gechelon-new.component.scss']
})
export class GEchelonNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: GEchelon;
  selectedEchelonId: any;
  @Output() creation: EventEmitter<GEchelon> = new EventEmitter();
  isModalVisible = false;
  echelons:GEchelon[]=[];
  

  constructor(public gEchelonSrv: GEchelonService,
    public router: Router) {
    this.entity = new GEchelon();
  }

  ngOnInit(): void {
  }

  save() {
    this.entity.suivant = this.selectedEchelonId;
    this.gEchelonSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new GEchelon();
      }, error => this.gEchelonSrv.httpSrv.catchError(error));
  }

  // open modal window
  openModal() {
    this.isModalVisible = true;
  }

  // close modal window
  closeModal() {
    this.isModalVisible = false;
  }

  findEchelons(){
    this.gEchelonSrv.findAll()
    .subscribe((data:any)=>{
      this.echelons=data;
    },error => this.gEchelonSrv.httpSrv.catchError(error));

  }

  onCreate(item: GEchelon) {
    this.findEchelons();
  }

}

