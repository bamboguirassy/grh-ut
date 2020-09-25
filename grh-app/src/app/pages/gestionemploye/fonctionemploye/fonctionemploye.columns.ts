const fonctionEmployeColumns = [
            { header: 'DatePriseFonction', field: 'datePriseFonction', dataKey: 'datePriseFonction' },
            { header: 'Duree', field: 'duree', dataKey: 'duree' },
            { header: 'Etat', field: 'etat', dataKey: 'etat' },
        ];

const allowedFonctionEmployeFieldsForFilter = [
    'datePriseFonction',
    'duree',
    'etat',
];

export { fonctionEmployeColumns,allowedFonctionEmployeFieldsForFilter };
