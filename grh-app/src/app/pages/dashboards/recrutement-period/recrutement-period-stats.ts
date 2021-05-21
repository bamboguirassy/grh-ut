import { TypeEmploye } from './../../parametrage/typeemploye/typeemploye';
import { BamboAbstractChartModel } from 'src/app/shared/classes/bambo-abstract-chart-model';
export class RecrutementPeriodStats extends BamboAbstractChartModel{
    typeEmploye: TypeEmploye;
    nbreEmploye: string;
    nbrHomme: string;
    nbrFemme: string;
}
