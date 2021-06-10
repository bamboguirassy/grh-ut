import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { first } from 'rxjs/operators';
import { IAppState } from 'src/app/interfaces/app-state';
import { IPageData } from 'src/app/interfaces/page-data';
import { SETTINGS } from 'src/environments/settings';
import * as PageActions from '../../../../store/actions/page.actions';
import { Structure } from '../../structure/structure';
import { StructureService } from '../../structure/structure.service';
import { StructureFonction } from '../../structurefonction/structurefonction';
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
  selectedOrientationType: string = 'horizontal';
  selectedStructure: Structure;

  nodes: any;

  constructor(public store: Store<IAppState>, public structureSrv: StructureService) {
    this.pageData = {
      title: 'Organigramme des fonctions',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Organigramme des fonctions'
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
    switch (event.nodeType) {
      case 'struct':
        this.selectedStructure = event.data;
        this.isFonctionModalVisible = true;
        break;

      case 'fonction':
        break;

      case 'fonctionParent':
        break;
    }

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
    return structure.children.map(struct => {
      let title = '';
      // if (struct.structureFonctions.length && struct.structureFonctions.some(sf => sf.etat)) {
      //   title += `${struct.structureFonctions.find(sf => sf.etat).fonction.nom}`;
      // }
      if (struct.structureFonctions.length && struct.structureFonctions.some(sf => sf.etat) && struct.structureFonctions.find(sf => sf.etat).fonctionEmployes.some(fe => fe.etat)) {
        title += ` - ${struct.structureFonctions.find(sf => sf.etat).fonctionEmployes.find(fe => fe.etat)?.employe?.prenoms + ' ' + struct.structureFonctions.find(sf => sf.etat).fonctionEmployes.find(fe => fe.etat)?.employe?.nom}`;
      }
      return {
        name: struct.nom,
        cssClass: 'ngx-org-ceo',
        image: 'assets/img/university.svg',
        title: struct.structureFonctions.length
          ? `${title}`
          : 'Aucun Poste défini',
        data: struct,
        nodeType: 'struct',
        childs: this.getChartTreeItem(struct)
      };
    }
    );
  }

  buildOrgChart() {
    const orgchartTreeItems: OrgchartTreeItem<Structure>[] = [];
    const rootEntity = this.structures.find(s => s.structureParente === null);
    let title = '';
    // if (rootEntity.structureFonctions.length && rootEntity.structureFonctions.some(sf => sf.etat)) {
    //   title += `${rootEntity.structureFonctions.find(sf => sf.etat).fonction.nom}`;
    // }
    if (rootEntity.structureFonctions.length && rootEntity.structureFonctions.some(sf => sf.etat) && rootEntity.structureFonctions.find(sf => sf.etat).fonctionEmployes.some(fe => fe.etat)) {
      title += ` - ${rootEntity.structureFonctions.find(sf => sf.etat).fonctionEmployes.find(fe => fe.etat)?.employe?.prenoms + ' ' + rootEntity.structureFonctions.find(sf => sf.etat).fonctionEmployes.find(fe => fe.etat)?.employe?.nom}`;
    }
    orgchartTreeItems.push({
      name: rootEntity.nom,
      cssClass: 'ngx-org-ceo',
      image: 'assets/img/university.svg',
      title: rootEntity.structureFonctions.length
        ? `${title}`
        : 'Aucun Poste défini',
      data: rootEntity,
      nodeType: 'struct',
      childs: this.getChartTreeItem(rootEntity)
    });
    this.nodes = orgchartTreeItems;

  }

  onCreatedStructureFonction(structureFonctions: StructureFonction[]) {
    console.log(structureFonctions);
    this.structures.forEach(s => {
      if (s.id === this.selectedStructure.id) {
        s.structureFonctions.concat(structureFonctions);
      }
    });
    this.buildOrgChart();
    this.nodes = [...this.nodes];
  }
}
