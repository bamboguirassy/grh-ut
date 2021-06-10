import { Component, OnInit } from '@angular/core';
import { Employe } from '../employe';
import { EmployeColumnItem } from '../employe.columns';
import { EmployeService } from '../employe.service';

@Component({
  selector: 'app-employe-list-global',
  templateUrl: './employe-list-global.component.html',
  styleUrls: ['./employe-list-global.component.scss']
})
export class EmployeListGlobalComponent implements OnInit {
  employes: Employe[] = []

  listOfColumns: EmployeColumnItem[] = [
    {
      name: 'Prenoms',
      sortOrder: null,
      listOfFilter: [],
      sortFn: (a: Employe, b: Employe) => a.prenoms.localeCompare(b.prenoms),
      filterFn: (list: string[], item: Employe) => list.some(prenoms => item.prenoms.indexOf(prenoms) !== -1),
      nzLeft: true
    },
    {
      name: 'Nom',
      sortOrder: null,
      sortFn: (a: Employe, b: Employe) => a.nom.localeCompare(b.nom),
      listOfFilter: [],
      filterFn: null,
      nzLeft: true
    },
    {
      name: 'Date Naissance',
      sortFn: null,
      sortOrder: null,
      listOfFilter: [],
      filterFn: null
    },
    {
      name: 'Lieu naissance',
      sortOrder: null,
      sortFn: (a: Employe, b: Employe) => a.lieuNaissance.localeCompare(b.lieuNaissance),
      listOfFilter: [],
      filterFn: null
    },
    {
      name: 'CNI/Passeport',
      sortOrder: null,
      sortFn: (a: Employe, b: Employe) => a.cni.localeCompare(b.cni),
      listOfFilter: [],
      filterFn: null
    },
    {
      name: 'Profession',
      sortOrder: null,
      sortFn: (a: Employe, b: Employe) => a.profession.nom.localeCompare(b.profession.nom),
      listOfFilter: [],
      filterFn: null
    },
    {
      name: 'Matricule Caisse Sociale',
      sortOrder: null,
      sortFn: (a: Employe, b: Employe) => a.matriculeCaisseSociale.localeCompare(b.matriculeCaisseSociale),
      listOfFilter: [],
      filterFn: null
    },
    {
      name: 'Date Recrutement',
      sortOrder: null,
      sortFn: (a: Employe, b: Employe) => a.dateRecrutement.localeCompare(b.dateRecrutement),
      listOfFilter: [],
      filterFn: null
    },
    {
      name: 'Situation Matrimoniale',
      sortOrder: null,
      sortFn: (a: Employe, b: Employe) => a.situtationMatrimoniale.localeCompare(b.situtationMatrimoniale),
      listOfFilter: [],
      filterFn: null
    },
    {
      name: 'Genre',
      sortOrder: null,
      sortFn: (a: Employe, b: Employe) => a.genre.localeCompare(b.genre),
      listOfFilter: [],
      filterFn: null
    },
    {
      name: 'Etat',
      sortOrder: null,
      sortFn: null,
      listOfFilter: [],
      filterFn: null
    },
    {
      name: 'Email Instutitionnel',
      sortOrder: null,
      sortFn: (a: Employe, b: Employe) => a.emailUniv.localeCompare(b.emailUniv),
      listOfFilter: [],
      filterFn: null
    },
    {
      name: 'Email Personnel',
      sortOrder: null,
      sortFn: (a: Employe, b: Employe) => a.email.localeCompare(b.email),
      listOfFilter: [],
      filterFn: null
    },
    {
      name: 'Téléphone Primaire',
      sortOrder: null,
      sortFn: (a: Employe, b: Employe) => a.telephonePrimaire.localeCompare(b.telephonePrimaire),
      listOfFilter: [],
      filterFn: null
    },
    {
      name: 'Téléphone Secondaire',
      sortOrder: null,
      sortFn: (a: Employe, b: Employe) => a.telephoneSecondaire.localeCompare(b.telephoneSecondaire),
      listOfFilter: [],
      filterFn: null
    },
    {
      name: 'Nationalité',
      sortOrder: null,
      sortFn: (a: Employe, b: Employe) => a.nationalite.nomFrFr.localeCompare(b.nationalite.nomFrFr),
      listOfFilter: [],
      filterFn: null
    },
    {
      name: 'Structure',
      sortOrder: null,
      sortFn: (a: Employe, b: Employe) => a.structure.nom.localeCompare(b.structure.nom),
      listOfFilter: [],
      filterFn: null
    },
    {
      name: 'Caisse Social',
      sortOrder: null,
      sortFn: (a: Employe, b: Employe) => a.caisseSociale.nom.localeCompare(b.caisseSociale.nom),
      listOfFilter: [],
      filterFn: null
    },
    {
      name: 'Mutuelle de Santé',
      sortOrder: null,
      sortFn: (a: Employe, b: Employe) => a.mutuelleSante.nom.localeCompare(b.mutuelleSante.nom),
      listOfFilter: [],
      filterFn: null
    },
    {
      name: 'Date Prise Service',
      sortOrder: null,
      sortFn: (a: Employe, b: Employe) => a.datePriseService.localeCompare(b.datePriseService),
      listOfFilter: [],
      filterFn: null
    }
  ];

  constructor(
    public employeSrv: EmployeService
  ) { }

  ngOnInit(): void {
    this.employeSrv.findAll();
    this.fetchEmployes();
  }

  trackByName(_: number, item: EmployeColumnItem): string {
    return item.name;
  }

  resetFilters(): void {
    this.listOfColumns.forEach(item => {
      if (item.name === 'Name') {
        item.listOfFilter = [
          { text: 'Joe', value: 'Joe' },
          { text: 'Jim', value: 'Jim' }
        ];
      } else if (item.name === 'Address') {
        item.listOfFilter = [
          { text: 'London', value: 'London' },
          { text: 'Sidney', value: 'Sidney' }
        ];
      }
    });
  }

  resetSortAndFilters(): void {
    this.listOfColumns.forEach(item => {
      item.sortOrder = null;
    });
    this.resetFilters();
  }

  fetchEmployes() {
    this
      .employeSrv
      .employesProvider
      .subscribe((employes: Employe[]) => {
        this.employes = employes;
      }, err => {
        this.employeSrv.httpSrv.catchError(err);
      })
  }

}
