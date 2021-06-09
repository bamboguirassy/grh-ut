import { NzTableFilterFn, NzTableFilterList, NzTableSortFn, NzTableSortOrder } from 'ng-zorro-antd/table';

const employeColumns = [
    { header: 'Prenoms', field: 'prenoms', dataKey: 'prenoms' },
    { header: 'Nom', field: 'nom', dataKey: 'nom' },
    { header: 'DateNaissance', field: 'dateNaissance', dataKey: 'dateNaissance' },
    { header: 'LieuNaissance', field: 'lieuNaissance', dataKey: 'lieuNaissance' },
    { header: 'Cni', field: 'cni', dataKey: 'cni' },
    { header: 'Matricule', field: 'matricule', dataKey: 'matricule' },
    { header: 'MatriculeCaisseSociale', field: 'matriculeCaisseSociale', dataKey: 'matriculeCaisseSociale' },
    { header: 'DateRecrutement', field: 'dateRecrutement', dataKey: 'dateRecrutement' },
    { header: 'SitutationMatrimoniale', field: 'situtationMatrimoniale', dataKey: 'situtationMatrimoniale' },
    { header: 'Genre', field: 'genre', dataKey: 'genre' },
    { header: 'Etat', field: 'etat', dataKey: 'etat' },
    { header: 'EmailUniv', field: 'emailUniv', dataKey: 'emailUniv' },
    { header: 'Email', field: 'email', dataKey: 'email' },
    { header: 'Filename', field: 'filename', dataKey: 'filename' },
    { header: 'Filepath', field: 'filepath', dataKey: 'filepath' },
    { header: 'TelephonePrimaire', field: 'telephonePrimaire', dataKey: 'telephonePrimaire' },
    { header: 'TelephoneSecondaire', field: 'telephoneSecondaire', dataKey: 'telephoneSecondaire' },
];

const allowedEmployeFieldsForFilter = [
    'prenoms',
    'nom',
    'dateNaissance',
    'lieuNaissance',
    'cni',
    'matricule',
    'matriculeCaisseSociale',
    'dateRecrutement',
    'situtationMatrimoniale',
    'genre',
    'etat',
    'emailUniv',
    'email',
    'filename',
    'filepath',
    'telephonePrimaire',
    'telephoneSecondaire',
];

export interface EmployeColumnItem {
    name: string;
    sortOrder: NzTableSortOrder | null;
    sortFn: NzTableSortFn | null;
    listOfFilter: NzTableFilterList;
    filterFn: NzTableFilterFn | null;
}


export { employeColumns, allowedEmployeFieldsForFilter };