const membreSyndicatColumns = [
            { header: 'DateEnregistrement', field: 'dateEnregistrement', dataKey: 'dateEnregistrement' },
            { header: 'Etat', field: 'etat', dataKey: 'etat' },
        ];

const allowedMembreSyndicatFieldsForFilter = [
    'dateEnregistrement',
    'etat',
];

export { membreSyndicatColumns,allowedMembreSyndicatFieldsForFilter };
