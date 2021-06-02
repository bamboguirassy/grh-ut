const membreCommissionColumns = [
            { header: 'Fonction', field: 'fonction', dataKey: 'fonction' },
            { header: 'DateIntegration', field: 'dateIntegration', dataKey: 'dateIntegration' },
            { header: 'Statut', field: 'statut', dataKey: 'statut' },
            { header: 'DateSortie', field: 'dateSortie', dataKey: 'dateSortie' },
            { header: 'MotifSortie', field: 'motifSortie', dataKey: 'motifSortie' },
        ];

const allowedMembreCommissionFieldsForFilter = [
    'fonction',
    'dateIntegration',
    'statut',
    'dateSortie',
    'motifSortie',
];

export { membreCommissionColumns,allowedMembreCommissionFieldsForFilter };
