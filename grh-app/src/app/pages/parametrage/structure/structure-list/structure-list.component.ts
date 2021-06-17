import { BasePageComponent } from '../../../base-page/base-page.component';
import { IAppState } from './../../../../interfaces/app-state';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Store } from '@ngrx/store';
import { StructureService } from '../structure.service';
import { Structure } from '../structure';

@Component({
  selector: 'app-structure-list',
  templateUrl: './structure-list.component.html',
  styleUrls: ['./structure-list.component.scss']
})
export class StructureListComponent extends BasePageComponent<Structure> implements OnInit, OnDestroy {

  constructor(store: Store<IAppState>,
    public structureSrv: StructureService) {
    super(store, structureSrv);
    this.setLoaded();

    this.pageData = {
      title: 'Liste des Structures',
      breadcrumbs: [
        {
          title: 'Accueil',
          route: ''
        },
        {
          title: 'Liste des structures'
        }
      ]
    };
  }

  findOrganigramme() {
    this.structureSrv.findOrganigramme()
      .subscribe((data: any) => {
        this.items = data;
        this.handlePostLoad();
      }, err => this.structureSrv.httpSrv.catchError(err));
  }

  ngOnInit(): void {
    super.ngOnInit();
    this.findOrganigramme();
  }

  ngOnDestroy() {
    super.ngOnDestroy();
  }

  handlePostDelete() {
    this.findOrganigramme();
  }

  handlePostLoad() {
    this.items = this.items.filter(item => item.structureParente == null);
    this.items.forEach(item => {
      this.mapOfExpandedData[item.id] = this.convertTreeToList(item);
    });
  }

  mapOfExpandedData: { [id: string]: any[] } = {};

  collapse(array: any[], data: any, $event: boolean): void {
    if (!$event) {
      if (data.children) {
        data.children.forEach(d => {
          const target = array.find(a => a.id === d.id)!;
          target.expand = false;
          this.collapse(array, target, false);
        });
      } else {
        return;
      }
    }
  }

  convertTreeToList(root: any): any[] {
    const stack: any[] = [];
    const array: any[] = [];
    const hashMap = {};
    stack.push({ ...root, level: 0, expand: false });

    while (stack.length !== 0) {
      const node = stack.pop()!;
      this.visitNode(node, hashMap, array);
      if (node.children) {
        for (let i = node.children.length - 1; i >= 0; i--) {
          stack.push({ ...node.children[i], level: node.level! + 1, expand: false, parent: node });
        }
      }
    }

    return array;
  }

  visitNode(node: any, hashMap: { [id: string]: boolean }, array: any[]): void {
    if (!hashMap[node.id]) {
      hashMap[node.id] = true;
      array.push(node);
    }
  }

}
