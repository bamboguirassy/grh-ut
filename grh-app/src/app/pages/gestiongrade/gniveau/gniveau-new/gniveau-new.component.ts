import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { GNiveauService } from '../gniveau.service';
import { GNiveau } from '../gniveau';
import { Router } from '@angular/router';
import { GEchelon } from '../../gechelon/gechelon';

@Component({
  selector: 'app-gniveau-new',
  templateUrl: './gniveau-new.component.html',
  styleUrls: ['./gniveau-new.component.scss']
})
export class GNiveauNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: GNiveau;
  @Output() creation: EventEmitter<GNiveau> = new EventEmitter();
  isModalVisible = false;
  selectedNiveauId:any;
  niveaux:GNiveau[]=[];
  constructor(public gNiveauSrv: GNiveauService,
    public router: Router) {
    this.entity = new GNiveau();
  }

  ngOnInit(): void {}

  save() {
    this.entity.suivant=this.selectedNiveauId;
    this.gNiveauSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new GNiveau();
      }, error => this.gNiveauSrv.httpSrv.catchError(error));
  }

  // open modal window
  openModal() {
    this.isModalVisible = true;
  }

  // close modal window
  closeModal() {
    this.isModalVisible = false;
  }

  findNiveaux(){
    this.gNiveauSrv.findAll()
    .subscribe((data:any)=>{
      this.niveaux=data;
    },error => this.gNiveauSrv.httpSrv.catchError(error));
  }

}

