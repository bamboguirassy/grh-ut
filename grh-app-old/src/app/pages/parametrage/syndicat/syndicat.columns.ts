const syndicatColumns = [
            { header: 'Nom', field: 'nom', dataKey: 'nom' },
            { header: 'Code', field: 'code', dataKey: 'code' },
            { header: 'Filename', field: 'filename', dataKey: 'filename' },
            { header: 'Filepath', field: 'filepath', dataKey: 'filepath' },
            { header: 'MontantCotisationMensuelle', field: 'montantCotisationMensuelle', dataKey: 'montantCotisationMensuelle' },
        ];

const allowedSyndicatFieldsForFilter = [
    'nom',
    'code',
    'filename',
    'filepath',
    'montantCotisationMensuelle',
];

export { syndicatColumns,allowedSyndicatFieldsForFilter };
