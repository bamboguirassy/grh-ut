const affectationColumns = [
            { header: 'Date', field: 'date', dataKey: 'date' },
            { header: 'Motif', field: 'motif', dataKey: 'motif' },
            { header: 'Poste', field: 'poste', dataKey: 'poste' },
        ];

const allowedAffectationFieldsForFilter = [
    'date',
    'motif',
    'poste',
];

export { affectationColumns,allowedAffectationFieldsForFilter };
