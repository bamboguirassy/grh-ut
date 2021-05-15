import { Component, OnInit, ViewChild, ElementRef, Output, EventEmitter, ViewChildren } from '@angular/core';
import { GCategorieService } from '../gcategorie.service';
import { GCategorie } from '../gcategorie';
import { Router } from '@angular/router';

@Component({
  selector: 'app-gcategorie-new',
  templateUrl: './gcategorie-new.component.html',
  styleUrls: ['./gcategorie-new.component.scss']
})
export class GCategorieNewComponent implements OnInit {

  @ViewChild('modalBody', { static: true }) modalBody: ElementRef<any>;
  @ViewChild('modalFooter', { static: true }) modalFooter: ElementRef<any>;
  @ViewChildren('form') form;
  entity: GCategorie;
  @Output() creation: EventEmitter<GCategorie> = new EventEmitter();
  isModalVisible = false;
  categories: GCategorie[] = [];
  selectedCategorieId: any;

  constructor(public gCategorieSrv: GCategorieService,
    public router: Router) {
    this.entity = new GCategorie();
  }

  ngOnInit(): void {
    this.findCategories();
  }

  save() {
    this.entity.suivant = this.selectedCategorieId;
    this.gCategorieSrv.create(this.entity)
      .subscribe((data: any) => {
        this.closeModal();
        this.creation.emit(data);
        this.entity = new GCategorie();
      }, error => this.gCategorieSrv.httpSrv.catchError(error));
  }

  // open modal window
  openModal() {
    this.isModalVisible = true;
  }

  // close modal window
  closeModal() {
    this.isModalVisible = false;
  }

  findCategories() {
    this.gCategorieSrv.findAll()
    .subscribe((data: any)=>{
      this.categories = data;
    }, err =>this.gCategorieSrv.httpSrv.catchError(err));
  }

}

