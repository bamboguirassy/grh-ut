const contratColumns = [
            { header: 'DureeEnMois', field: 'dureeEnMois', dataKey: 'dureeEnMois' },
            { header: 'DateRupture', field: 'dateRupture', dataKey: 'dateRupture' },
            { header: 'MotifRupture', field: 'motifRupture', dataKey: 'motifRupture' },
            { header: 'Expire', field: 'expire', dataKey: 'expire' },
            { header: 'Rompu', field: 'rompu', dataKey: 'rompu' },
            { header: 'DateCreation', field: 'dateCreation', dataKey: 'dateCreation' },
            { header: 'DateSignature', field: 'dateSignature', dataKey: 'dateSignature' },
        ];

const allowedContratFieldsForFilter = [
    'dureeEnMois',
    'dateRupture',
    'motifRupture',
    'expire',
    'rompu',
    'dateCreation',
    'dateSignature',
    
];

export { contratColumns,allowedContratFieldsForFilter };
