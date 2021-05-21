const contratColumns = [
            { header: 'DureeEnMois', field: 'dureeEnMois', dataKey: 'dureeEnMois' },
            { header: 'DateFinEffective', field: 'dateFinEffective', dataKey: 'dateFinEffective' },
            { header: 'MotifFin', field: 'motifFin', dataKey: 'motifFin' },
            { header: 'CommentaireSurFinContrat', field: 'commentaireSurFinContrat', dataKey: 'commentaireSurFinContrat' },
            { header: 'Etat', field: 'etat', dataKey: 'etat' },
            { header: 'DateCreation', field: 'dateCreation', dataKey: 'dateCreation' },
            { header: 'DateSignature', field: 'dateSignature', dataKey: 'dateSignature' },
            { header: 'DateDebut', field: 'dateDebut', dataKey: 'dateDebut' },
        ];

const allowedContratFieldsForFilter = [
    'dureeEnMois',
    'dateFinEffective',
    'motifFin',
    'commentaireSurFinContrat',
    'etat',
    'dateCreation',
    'dateSignature',
    'dateDebut',
    
];

export { contratColumns,allowedContratFieldsForFilter };
