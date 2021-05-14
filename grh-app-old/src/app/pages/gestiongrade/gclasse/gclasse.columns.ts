const gClasseColumns = [
            { header: 'Nom', field: 'nom', dataKey: 'nom' },
            { header: 'Indice', field: 'indice', dataKey: 'indice' },
            { header: 'Ordre', field: 'ordre', dataKey: 'ordre' },
        ];

const allowedGClasseFieldsForFilter = [
    'nom',
    'indice',
    'ordre',
];

export { gClasseColumns,allowedGClasseFieldsForFilter };
