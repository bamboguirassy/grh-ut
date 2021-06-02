import { BamboAbstractChartModel } from 'src/app/shared/classes/bambo-abstract-chart-model';
import { Grade } from '../../gestiongrade/grade/grade';

export class GradeEmployeCM extends BamboAbstractChartModel{
    grade: Grade;
    nombreEmploye: number;
}