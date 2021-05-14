const diplomeEmployeColumns = [
            { header: 'AnneeObtention', field: 'anneeObtention', dataKey: 'anneeObtention' },
            { header: 'Etablissement', field: 'etablissement', dataKey: 'etablissement' },
        ];

const allowedDiplomeEmployeFieldsForFilter = [
    'anneeObtention',
    'etablissement',
];

export { diplomeEmployeColumns,allowedDiplomeEmployeFieldsForFilter };
