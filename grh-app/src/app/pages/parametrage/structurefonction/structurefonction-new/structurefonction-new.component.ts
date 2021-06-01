import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren, Input } from '@angular/core';
import { StructureFonctionService } from '../structurefonction.service';
import { StructureFonction } from '../structurefonction';
import { Router } from '@angular/router';
import { Fonction } from '../../fonction/fonction';
import { FonctionService } from '../../fonction/fonction.service';
import { finalize, first } from 'rxjs/operators';
import { Structure } from '../../structure/structure';

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
  fonctions: Fonction[] = [];
  fetching = false;
  selectedFonctions: Fonction[] = [];
  structureFonctions: StructureFonction[] = [];
  constructor(public structureFonctionSrv: StructureFonctionService, public fonctionSrv: FonctionService,
    public router: Router) {
    this.entity = new StructureFonction();
  }

  ngOnInit(): void {
  }

  save() {
    this
      .structureFonctionSrv
      .createMultiple(this.structureFonctions.map(sf => ({ etat: sf.etat, fonction: sf.fonction.id, structure: this.structure.id } as any)), this.structure)
      .subscribe((data: any) => {
        this.closeModal();
        this.structure.structureFonctions.concat(data);
        this.creation.emit(data);
        this.entity = new StructureFonction();
        this.selectedFonctions = [];
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

  onFonctionSelected(fonction: any) {
    this.structureFonctions = [{ etat: false, fonction: fonction, structure: this.structure } as any];
  }

  fetchNotBindedFonctions() {
    const arr: Structure[] = [];
    this.fetching = true;
    this
      .fonctionSrv
      .findNotBindedByStructure(this.structure)
      .pipe(first(), finalize(() => this.fetching = false))
      .subscribe((fonctions: any) => {
        this.fonctions = fonctions;
      }, err => {
        this.fonctionSrv.httpSrv.catchError(err);
      });
  }
}

