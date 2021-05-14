const gNiveauColumns = [
            { header: 'Nom', field: 'nom', dataKey: 'nom' },
            { header: 'Indice', field: 'indice', dataKey: 'indice' },
            { header: 'Ordre', field: 'ordre', dataKey: 'ordre' },
        ];

const allowedGNiveauFieldsForFilter = [
    'nom',
    'indice',
    'ordre',
];

export { gNiveauColumns,allowedGNiveauFieldsForFilter };
