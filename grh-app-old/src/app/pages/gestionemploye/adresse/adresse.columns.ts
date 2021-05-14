const adresseColumns = [
            { header: 'Ville', field: 'ville', dataKey: 'ville' },
            { header: 'Quartier', field: 'quartier', dataKey: 'quartier' },
            { header: 'Etat', field: 'etat', dataKey: 'etat' },
        ];

const allowedAdresseFieldsForFilter = [
    'ville',
    'quartier',
    'etat',
];

export { adresseColumns,allowedAdresseFieldsForFilter };
