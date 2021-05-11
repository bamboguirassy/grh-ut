import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { first } from 'rxjs/operators';
import { IAppState } from 'src/app/interfaces/app-state';
import { IPageData } from 'src/app/interfaces/page-data';
import { SETTINGS } from 'src/environments/settings';
import * as PageActions from '../../../../store/actions/page.actions';
import { Structure } from '../../structure/structure';
import { StructureService } from '../../structure/structure.service';
import { OrgchartTreeItem } from '../orgchart-tree-item';


@Component({
  selector: 'app-organigramme-view',
  templateUrl: './organigramme-view.component.html',
  styleUrls: ['./organigramme-view.component.scss']
})
export class OrganigrammeViewComponent implements OnInit {
  isFonctionModalVisible = false;
  pageData: IPageData;
  lightGradient = ['#fff', SETTINGS.topbarBg];
  secondViewBorder = 'info';
  structures: Structure[] = [];
  selectedOrientationType : string = 'horizontal';
  selectedStructure: Structure;

  nodes: any;

  constructor(public store: Store<IAppState>, public structureSrv: StructureService) {
    this.pageData = {
      title: 'Organigramme',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Organigramme'
        }
      ]
    };
  }

  ngOnInit(): void {
    this.pageData ? this.store.dispatch(new PageActions.Set(this.pageData)) : null;
    this.setLoaded();
    this.findStructures();

  }

  openFonctionAdderModal(event: any) {
    this.selectedStructure = event.data;
    this.isFonctionModalVisible = true;
  }

  setLoaded(during: number = 0) {
    setTimeout(() => this.store.dispatch(new PageActions.Update({ loaded: true })), during);
  }

  findStructures() {
    this
      .structureSrv
      .findAll()
      .pipe(first())
      .subscribe((data: any) => {
        this.structures = data;
        this.buildOrgChart();
      }, err => {
        this.structureSrv.httpSrv.catchError(err)
      });
  }

  getChartTreeItem(structure: Structure): OrgchartTreeItem<Structure>[] {

    return structure.children.map(struct => ({
      name: struct.nom,
      cssClass: 'ngx-org-ceo',
      image: 'assets/img/university.svg',
      title: struct.typeEntite.nom,
      data: structure,
      childs: this.getChartTreeItem(struct)
    }));
  }

  buildOrgChart() {
    const orgchartTreeItems: OrgchartTreeItem<Structure>[] = [];
    const rootEntity = this.structures.find(s => s.code = "IES");
      orgchartTreeItems.push({
        name: rootEntity.nom,
        cssClass: 'ngx-org-ceo',
        image: 'assets/img/university.svg',
        title: rootEntity.typeEntite.nom,
        data: rootEntity,
        childs: this.getChartTreeItem(rootEntity)
      });
    this.nodes = orgchartTreeItems;
  }
}
