const commissionColumns = [
            { header: 'Nom', field: 'nom', dataKey: 'nom' },
            { header: 'Missions', field: 'missions', dataKey: 'missions' },
            { header: 'Etat', field: 'etat', dataKey: 'etat' },
            { header: 'Description', field: 'description', dataKey: 'description' },
            { header: 'DateCreation', field: 'dateCreation', dataKey: 'dateCreation' },
        ];

const allowedCommissionFieldsForFilter = [
    'nom',
    'missions',
    'etat',
    'description',
    'dateCreation',
];

export { commissionColumns,allowedCommissionFieldsForFilter };
