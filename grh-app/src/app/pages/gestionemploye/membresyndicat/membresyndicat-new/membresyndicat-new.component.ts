import { SyndicatService } from './../../../parametrage/syndicat/syndicat.service';
import { Syndicat } from './../../../parametrage/syndicat/syndicat';
import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren, Input } from '@angular/core';
import { MembreSyndicatService } from '../membresyndicat.service';
import { MembreSyndicat } from '../membresyndicat';
import { Router } from '@angular/router';
import { Employe } from '../../employe/employe';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-membresyndicat-new',
  templateUrl: './membresyndicat-new.component.html',
  styleUrls: ['./membresyndicat-new.component.scss']
})
export class MembreSyndicatNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: MembreSyndicat;
  @Output() creation: EventEmitter<MembreSyndicat> = new EventEmitter();
  isModalVisible = false;
  @Input() employe: Employe;
  syndicats: any[] = [];
  filtreSyndicats: any = [];
  selectedSyndicat: Syndicat;
  selectedType: any;

  constructor(public membreSyndicatSrv: MembreSyndicatService,
    public router: Router, public datePipe: DatePipe,
    public syndicatSrv: SyndicatService) {
    this.entity = new MembreSyndicat();

  }

  ngOnInit(): void {
    this.findSyndicats();
  }

  save() {
    this.entity.employe = this.employe.id;
    this.entity.syndicat = this.selectedSyndicat.id;
    this.entity.dateEnregistrement = this.datePipe.transform(this.entity.dateEnregistrement, 'yyyy-MM-dd');
    this.membreSyndicatSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new MembreSyndicat();
      }, error => this.membreSyndicatSrv.httpSrv.catchError(error));
  }

  // open modal window
  openModal() {
    this.isModalVisible = true;
  }

  // close modal window
  closeModal() {
    this.isModalVisible = false;
  }

  findSyndicats() {
    this.syndicatSrv.findByTypeEmploye(this.employe.typeEmploye)
      .subscribe((data: any) => {
        this.syndicats = data;
      }, err => this.syndicatSrv.httpSrv.catchError(err));
  }

}

