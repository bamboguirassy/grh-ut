import { Component, OnInit, OnDestroy, ViewChild, ElementRef, Output, EventEmitter, Input } from '@angular/core';
import { MembreFamille } from '../membrefamille';
import { MembreFamilleService } from '../membrefamille.service';
import { Router, ActivatedRoute } from '@angular/router';
import { first } from 'rxjs/operators';
import { Store } from '@ngrx/store';
import { IAppState } from 'src/app/interfaces/app-state';
import { BasePageComponent } from 'src/app/pages/base-page';
import { DatePipe, Location } from '@angular/common';

@Component({
  selector: 'app-membrefamille-edit',
  templateUrl: './membrefamille-edit.component.html',
  styleUrls: ['./membrefamille-edit.component.scss']
})
export class MembreFamilleEditComponent implements OnInit, OnDestroy {
  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  isModalVisible = false;
  entity: MembreFamille;
  @Output() modification: EventEmitter<MembreFamille> = new EventEmitter();
  @Output() onClose: EventEmitter<any> = new EventEmitter();
  @Input() set selectedMembreFamille(value) {
    this.entity = value;
    this.selectedGenre = this.entity.genre;
    this.handlePostLoad();
    this.openModal();

  }
  selectedGenre: any;
  
  constructor(
    public membreFamilleSrv: MembreFamilleService,
    public router: Router,
    private activatedRoute: ActivatedRoute,
    public location: Location, public datePipe: DatePipe) {

  }

  ngOnInit(): void {
  }

  ngOnDestroy() {
  }

  handlePostLoad() {
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

  prepareUpdate() {

  }
  update() {

    this.entity.genre = this.selectedGenre;
    console.log(this.entity.genre );

    if (this.entity.dateMariage) {
      this.entity.dateMariage = this.datePipe.transform(this.entity.dateMariage, 'yyyy-MM-dd');
    }
    this.entity.dateNaissance = this.datePipe.transform(this.entity.dateNaissance, 'yyyy-MM-dd');
    this.membreFamilleSrv.update(this.entity)
      .subscribe((resp: any) => {
        this.closeModal();
        this.modification.emit(resp);
      }, (err) => {
        this.membreFamilleSrv.httpSrv.catchError(err);
      });
  }
  handlePostUpdate() {
    this.location.back();
  }

}
