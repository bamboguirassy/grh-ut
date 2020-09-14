const structureColumns = [
            { header: 'Nom', field: 'nom', dataKey: 'nom' },
            { header: 'Code', field: 'code', dataKey: 'code' },
            { header: 'Adresse', field: 'adresse', dataKey: 'adresse' },
            { header: 'Telephone', field: 'telephone', dataKey: 'telephone' },
        ];

const allowedStructureFieldsForFilter = [
    'nom',
    'code',
    'adresse',
    'telephone',
];

export { structureColumns,allowedStructureFieldsForFilter };
