const gCategorieColumns = [
            { header: 'Nom', field: 'nom', dataKey: 'nom' },
            { header: 'Indice', field: 'indice', dataKey: 'indice' },
            { header: 'Ordre', field: 'ordre', dataKey: 'ordre' },
        ];

const allowedGCategorieFieldsForFilter = [
    'nom',
    'indice',
    'ordre',
];

export { gCategorieColumns,allowedGCategorieFieldsForFilter };
