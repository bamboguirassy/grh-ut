const gEchelonColumns = [
            { header: 'Nom', field: 'nom', dataKey: 'nom' },
            { header: 'Indice', field: 'indice', dataKey: 'indice' },
            { header: 'Ordre', field: 'ordre', dataKey: 'ordre' },
        ];

const allowedGEchelonFieldsForFilter = [
    'nom',
    'indice',
    'ordre',
];

export { gEchelonColumns,allowedGEchelonFieldsForFilter };
