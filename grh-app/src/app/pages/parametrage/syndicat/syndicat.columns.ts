const syndicatColumns = [
            { header: 'Nom', field: 'nom', dataKey: 'nom' },
            { header: 'Code', field: 'code', dataKey: 'code' },
            { header: 'Type', field: 'type', dataKey: 'type' },
            { header: 'Filename', field: 'filename', dataKey: 'filename' },
            { header: 'Filepath', field: 'filepath', dataKey: 'filepath' },
            { header: 'MontantCotisationMensuelle', field: 'montantCotisationMensuelle', dataKey: 'montantCotisationMensuelle' },
        ];

const allowedSyndicatFieldsForFilter = [
    'nom',
    'code',
    'type',
    'filename',
    'filepath',
    'montantCotisationMensuelle',
];

export { syndicatColumns,allowedSyndicatFieldsForFilter };
