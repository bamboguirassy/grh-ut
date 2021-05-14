const contratColumns = [
            { header: 'DureeEnMois', field: 'dureeEnMois', dataKey: 'dureeEnMois' },
            { header: 'Etat', field: 'etat', dataKey: 'etat' },
            { header: 'DateRupture', field: 'dateRupture', dataKey: 'dateRupture' },
            { header: 'MotifRupture', field: 'motifRupture', dataKey: 'motifRupture' },
            { header: 'Expire', field: 'expire', dataKey: 'expire' },
            { header: 'Rompu', field: 'rompu', dataKey: 'rompu' },
        ];

const allowedContratFieldsForFilter = [
    'dureeEnMois',
    'etat',
    'dateRupture',
    'motifRupture',
    'expire',
    'rompu',
];

export { contratColumns,allowedContratFieldsForFilter };
