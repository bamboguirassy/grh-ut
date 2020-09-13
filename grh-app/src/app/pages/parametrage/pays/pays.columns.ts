const payColumns = [
            { header: 'Code', field: 'code', dataKey: 'code' },
            { header: 'Alpha2', field: 'alpha2', dataKey: 'alpha2' },
            { header: 'Alpha3', field: 'alpha3', dataKey: 'alpha3' },
            { header: 'NomEnGb', field: 'nomEnGb', dataKey: 'nomEnGb' },
            { header: 'NomFrFr', field: 'nomFrFr', dataKey: 'nomFrFr' },
            { header: 'Nationalite', field: 'nationalite', dataKey: 'nationalite' },
        ];

const allowedPaysFieldsForFilter = [
    'code',
    'alpha2',
    'alpha3',
    'nomEnGb',
    'nomFrFr',
    'nationalite',
];

export { payColumns,allowedPaysFieldsForFilter };
