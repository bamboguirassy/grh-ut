import { Rang } from './../../rang/rang';
import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren, Input } from '@angular/core';
import { StructureFonctionService } from '../structurefonction.service';
import { StructureFonction } from '../structurefonction';
import { Router } from '@angular/router';
import { finalize, first } from 'rxjs/operators';
import { Structure } from '../../structure/structure';
import { RangService } from '../../rang/rang.service';

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
  @Input() structure: Structure;
  isModalVisible = false;
  rangs: Rang[] = [];
  fetching = false;
  selectedRangs: Rang[] = [];
  structureFonctions: StructureFonction[] = [];
  isLimited = false;
  duree = 0;
  constructor(public structureFonctionSrv: StructureFonctionService, public rangSrv: RangService,
    public router: Router) {
    this.entity = new StructureFonction();
  }

  ngOnInit(): void {
  }

  save() {
    this
      .structureFonctionSrv
      .createMultiple(this.structureFonctions.map(sf => ({ etat: sf.etat, rang: sf.rang.id, structure: this.structure.id, duree: this.duree } as any)), this.structure)
      .subscribe((data: any) => {
        this.closeModal();
        this.structure.structureFonctions.concat(data);
        this.creation.emit(data);
        this.entity = new StructureFonction();
        this.selectedRangs = [];
        this.structureFonctions = [];
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

  onFonctionSelected(rang: any) {
    this.structureFonctions = [{ etat: true, rang: rang, structure: this.structure, duree: 0 } as any];
  }

  fetchNotBindedFonctions() {
    const arr: Structure[] = [];
    this.fetching = true;
    this
      .rangSrv
      // .findNotBindedByStructure(this.structure)
      .findAll()
      .pipe(finalize(() => this.fetching = false))
      .subscribe((rangs: any) => {
        this.rangs = rangs;
      }, err => {
        this.rangSrv.httpSrv.catchError(err);
      });
  }

}

