const gEchelonColumns = [
            { header: 'Nom', field: 'nom', dataKey: 'nom' },
            { header: 'Indice', field: 'indice', dataKey: 'indice' },
            { header: 'Ordre', field: 'ordre', dataKey: 'ordre' },
            { header: 'Suivant', field: 'suivant', dataKey: 'suivant' },
        ];

const allowedGEchelonFieldsForFilter = [
    'nom',
    'indice',
    'ordre',
    'suivant',
];

export { gEchelonColumns,allowedGEchelonFieldsForFilter };
