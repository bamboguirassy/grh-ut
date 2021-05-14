const typeDocumentColumns = [
            { header: 'Nom', field: 'nom', dataKey: 'nom' },
            { header: 'DureeArchivage', field: 'dureeArchivage', dataKey: 'dureeArchivage' },
        ];

const allowedTypeDocumentFieldsForFilter = [
    'nom',
    'dureeArchivage',
];

export { typeDocumentColumns,allowedTypeDocumentFieldsForFilter };
