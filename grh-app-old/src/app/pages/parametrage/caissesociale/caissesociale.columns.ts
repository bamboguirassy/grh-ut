const caisseSocialeColumns = [
            { header: 'Nom', field: 'nom', dataKey: 'nom' },
            { header: 'Code', field: 'code', dataKey: 'code' },
            { header: 'Filename', field: 'filename', dataKey: 'filename' },
            { header: 'Filepath', field: 'filepath', dataKey: 'filepath' },
        ];

const allowedCaisseSocialeFieldsForFilter = [
    'nom',
    'code',
    'filename',
    'filepath',
];

export { caisseSocialeColumns,allowedCaisseSocialeFieldsForFilter };
