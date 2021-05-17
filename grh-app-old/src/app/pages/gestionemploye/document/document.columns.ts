const documentColumns = [
            { header: 'Nom', field: 'nom', dataKey: 'nom' },
            { header: 'Filename', field: 'filename', dataKey: 'filename' },
            { header: 'Filepath', field: 'filepath', dataKey: 'filepath' },
        ];

const allowedDocumentFieldsForFilter = [
    'nom',
    'filename',
    'filepath',
];

export { documentColumns,allowedDocumentFieldsForFilter };
