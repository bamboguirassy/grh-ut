import { Component, OnInit } from '@angular/core';
import { Employe } from '../employe';
import { EmployeColumnItem } from '../employe.columns';

@Component({
  selector: 'app-employe-list-global',
  templateUrl: './employe-list-global.component.html',
  styleUrls: ['./employe-list-global.component.scss']
})
export class EmployeListGlobalComponent implements OnInit {
  employes: Employe[] = [{
    "id": 1,
    "prenoms": "Moussa",
    "nom": "FOFANA",
    "dateNaissance": "1993-06-03 00:00:00",
    "lieuNaissance": "Did\u00e9 Gassama",
    "cni": "1916200200225",
    "matricule": "120254/B",
    "matriculeCaisseSociale": null,
    "dateRecrutement": "2021-01-01 00:00:00",
    "situtationMatrimoniale": "Mari\u00e9(e)",
    "genre": "Masculin",
    "etat": true,
    "emailUniv": "moussa.fofana@univ-thies.sn",
    "email": "didegassama@gmail.com",
    "filename": "60337ba47b089.jpeg",
    "filepath": "http://127.0.0.1:8000/uploads/employe/photo/60337ba47b089.jpeg",
    "telephonePrimaire": "+221780165026",
    "telephoneSecondaire": "+221762339081",
    "caisseSociale": {
      "id": 5,
      "nom": "Caisse de S\u00e9curit\u00e9 Sociale",
      "code": "CSS",
      "filename": "5f5e4e1b339f1.jpeg",
      "filepath": "http://127.0.0.1:8000/uploads/caissesociale/5f5e4e1b339f1.jpeg"
    },
    "indice": null,
    "mutuelleSante": {
      "id": 1,
      "nom": "Mutuelle de Sant\u00e9 des Agents de l'Etat",
      "code": "MSAE",
      "filename": "5f5e4c27e1e97.jpeg",
      "filepath": "http://127.0.0.1:8000/uploads/mutuellesante/5f5e4c27e1e97.jpeg"
    },
    "nationalite": {
      "id": 193,
      "code": 686,
      "alpha2": "SN",
      "alpha3": "SEN",
      "nomEnGb": "Senegal",
      "nomFrFr": "S\u00e9n\u00e9gal",
      "nationalite": "S\u00e9n\u00e9galaise"
    } ,
    "typeEmploye": {
      "id": 2,
      "nom": "Personnel Administratif Technique et des Services",
      "code": "PATS"
    },
    "profession": null,
    "datePriseService": null,
    "dateSortie": null,
    "motifSortie": null,
    "numeroMainOeuvre": null,
    "numeroAffiliationIpres": null,
    "structure": {
      "id": 3,
      "nom": "Direction des Syst\u00e8mes d'Informations",
      "code": "DSI",
      "adresse": null,
      "telephone": "339875869",
      "structureParente": null,
      "typeEntite": null,
      "children": [],
      "structureFonctions": []
    },
    "commentaireSortie": null,
    "grade": "1",
    "diplomeAcademique": null
  },
  {
    "id": 3012,
    "prenoms": "\u00c9douard",
    "nom": "Seguin",
    "dateNaissance": "2018-08-08 00:00:00",
    "lieuNaissance": "Gregoiredan",
    "cni": "FR832097655500W4OA6830H2433",
    "matricule": "42 070",
    "matriculeCaisseSociale": "78642",
    "dateRecrutement": "1997-06-20 00:00:00",
    "situtationMatrimoniale": "Divorc\u00e9(e)",
    "genre": "F\u00e9minin",
    "etat": true,
    "emailUniv": "mauriceetienne@univ-thies.sn",
    "email": "hguillet@free.fr",
    "filename": "0769986822494",
    "filepath": "https://lorempixel.com/640/480/?76527",
    "telephonePrimaire": "0152315392",
    "telephoneSecondaire": "+33 (0)3 32 82 27 62",
    "caisseSociale": {
      "id": 4,
      "nom": "Institut de Pr\u00e9voyance Retraite du S\u00e9n\u00e9gal",
      "code": "IPRES",
      "filename": "5f5e4e0722b58.jpeg",
      "filepath": "http://127.0.0.1:8000/uploads/caissesociale/5f5e4e0722b58.jpeg"
    },
    "indice": null,
    "mutuelleSante": {
      "id": 1,
      "nom": "Mutuelle de Sant\u00e9 des Agents de l'Etat",
      "code": "MSAE",
      "filename": "5f5e4c27e1e97.jpeg",
      "filepath": "http://127.0.0.1:8000/uploads/mutuellesante/5f5e4c27e1e97.jpeg"
    },
    "nationalite": {
      "id": 44,
      "code": 156,
      "alpha2": "CN",
      "alpha3": "CHN",
      "nomEnGb": "China",
      "nomFrFr": "Chine",
      "nationalite": "Chinois"
    },
    "typeEmploye": {
      "id": 2,
      "nom": "Personnel Administratif Technique et des Services",
      "code": "PATS"
    },
    "profession": null,
    "datePriseService": "2016-05-23 00:00:00",
    "dateSortie": null,
    "motifSortie": null,
    "numeroMainOeuvre": null,
    "numeroAffiliationIpres": null,
    "structure": {
      "id": 5,
      "nom": "Sciences et Technologie",
      "code": "SET",
      "adresse": null,
      "telephone": "339512585",
      "structureParente": null,
      "typeEntite": null,
      "children": [],
      "structureFonctions": []
    },
    "commentaireSortie": null,
    "grade": "1",
    "diplomeAcademique": null
  },
  {
    "id": 3014,
    "prenoms": "Laetitia",
    "nom": "Baron",
    "dateNaissance": "1976-01-28 00:00:00",
    "lieuNaissance": "Aubert",
    "cni": "FR103200218972Y49KUHOP0H723",
    "matricule": "17 056",
    "matriculeCaisseSociale": "97253",
    "dateRecrutement": "2005-05-12 00:00:00",
    "situtationMatrimoniale": "Veuf(ve)",
    "genre": "Masculin",
    "etat": false,
    "emailUniv": "micheldebreton@univ-thies.sn",
    "email": "claudine.descamps@orange.fr",
    "filename": "4681260482674",
    "filepath": "https://lorempixel.com/640/480/?12347",
    "telephonePrimaire": "+33 3 86 69 17 90",
    "telephoneSecondaire": "0688676997",
    "caisseSociale": {
      "id": 4,
      "nom": "Institut de Pr\u00e9voyance Retraite du S\u00e9n\u00e9gal",
      "code": "IPRES",
      "filename": "5f5e4e0722b58.jpeg",
      "filepath": "http://127.0.0.1:8000/uploads/caissesociale/5f5e4e0722b58.jpeg"
    },
    "indice": null,
    "mutuelleSante": {
      "id": 1,
      "nom": "Mutuelle de Sant\u00e9 des Agents de l'Etat",
      "code": "MSAE",
      "filename": "5f5e4c27e1e97.jpeg",
      "filepath": "http://127.0.0.1:8000/uploads/mutuellesante/5f5e4c27e1e97.jpeg"
    },
    "nationalite": {
      "id": 91,
      "code": 312,
      "alpha2": "GP",
      "alpha3": "GLP",
      "nomEnGb": "Guadeloupe",
      "nomFrFr": "Guadeloupe",
      "nationalite": "Goudeloup\u00e9en"
    },
    "typeEmploye": {
      "id": 2,
      "nom": "Personnel Administratif Technique et des Services",
      "code": "PATS"
    },
    "profession": null,
    "datePriseService": "1984-05-31 00:00:00",
    "dateSortie": null,
    "motifSortie": null,
    "numeroMainOeuvre": null,
    "numeroAffiliationIpres": null,
    "structure": {
      "id": 2,
      "nom": "Rectorat",
      "code": "RECT",
      "adresse": null,
      "telephone": "338856985",
      "structureParente": null,
      "typeEntite": null,
      "children": [],
      "structureFonctions": []
    },
    "commentaireSortie": null,
    "grade": "1",
    "diplomeAcademique": null
  },
  {
    "id": 3015,
    "prenoms": "Timoth\u00e9e",
    "nom": "Didier",
    "dateNaissance": "2009-02-04 00:00:00",
    "lieuNaissance": "Carre-sur-Mer",
    "cni": "FR057498496657T6BH7SJ2DDD55",
    "matricule": "07 444",
    "matriculeCaisseSociale": "78 675",
    "dateRecrutement": "1977-03-18 00:00:00",
    "situtationMatrimoniale": "Veuf(ve)",
    "genre": "F\u00e9minin",
    "etat": true,
    "emailUniv": "\u00c9dithgonzalez@univ-thies.sn",
    "email": "gautier.olivie@free.fr",
    "filename": "8664556303712",
    "filepath": "https://lorempixel.com/640/480/?78822",
    "telephonePrimaire": "+33 4 03 06 93 60",
    "telephoneSecondaire": "0415835221",
    "caisseSociale": {
      "id": 4,
      "nom": "Institut de Pr\u00e9voyance Retraite du S\u00e9n\u00e9gal",
      "code": "IPRES",
      "filename": "5f5e4e0722b58.jpeg",
      "filepath": "http://127.0.0.1:8000/uploads/caissesociale/5f5e4e0722b58.jpeg"
    },
    "indice": null,
    "mutuelleSante": {
      "id": 1,
      "nom": "Mutuelle de Sant\u00e9 des Agents de l'Etat",
      "code": "MSAE",
      "filename": "5f5e4c27e1e97.jpeg",
      "filepath": "http://127.0.0.1:8000/uploads/mutuellesante/5f5e4c27e1e97.jpeg"
    },
    "nationalite": {
      "id": 169,
      "code": 598,
      "alpha2": "PG",
      "alpha3": "PNG",
      "nomEnGb": "Papua New Guinea",
      "nomFrFr": "Papouasie-Nouvelle-Guin\u00e9e",
      "nationalite": "Papua\u00e9en"
    },
    "typeEmploye": {
      "id": 2,
      "nom": "Personnel Administratif Technique et des Services",
      "code": "PATS"
    },
    "profession": null,
    "datePriseService": "1983-03-25 00:00:00",
    "dateSortie": null,
    "motifSortie": null,
    "numeroMainOeuvre": null,
    "numeroAffiliationIpres": null,
    "structure": {
      "id": 9,
      "nom": "Ecole Normale Sup\u00e9rieure d'Agriculture",
      "code": "ENSA",
      "adresse": null,
      "telephone": "339815874",
      "structureParente": null,
      "typeEntite": null,
      "children": [],
      "structureFonctions": []
    },
    "commentaireSortie": null,
    "grade": "1",
    "diplomeAcademique": null
  }]

  listOfColumns: EmployeColumnItem[] = [
    {
      name: 'Prenoms',
      sortOrder: null,
      listOfFilter: [],
      sortFn: (a: Employe, b: Employe) => a.prenoms.localeCompare(b.prenoms),
      filterFn: (list: string[], item: Employe) => list.some(prenoms => item.prenoms.indexOf(prenoms) !== -1)
    },
    {
      name: 'Nom',
      sortOrder: null,
      sortFn: (a: Employe, b: Employe) => a.nom.localeCompare(b.nom),
      listOfFilter: [],
      filterFn: null
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

  constructor() { }

  ngOnInit(): void {
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

}
