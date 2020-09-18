const membreFamilleColumns = [
            { header: 'Prenoms', field: 'prenoms', dataKey: 'prenoms' },
            { header: 'Nom', field: 'nom', dataKey: 'nom' },
            { header: 'DateNaissance', field: 'dateNaissance', dataKey: 'dateNaissance' },
            { header: 'LieuNaissance', field: 'lieuNaissance', dataKey: 'lieuNaissance' },
            { header: 'Genre', field: 'genre', dataKey: 'genre' },
            { header: 'LienParente', field: 'lienParente', dataKey: 'lienParente' },
            { header: 'Telephone', field: 'telephone', dataKey: 'telephone' },
        ];

const allowedMembreFamilleFieldsForFilter = [
    'prenoms',
    'nom',
    'dateNaissance',
    'lieuNaissance',
    'genre',
    'lienParente',
    'telephone',
];

export { membreFamilleColumns,allowedMembreFamilleFieldsForFilter };
