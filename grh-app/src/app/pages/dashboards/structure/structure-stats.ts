import { Structure } from 'src/app/pages/parametrage/structure/structure';
import { BamboAbstractChartModel } from 'src/app/shared/classes/bambo-abstract-chart-model';
export class StructureStats extends BamboAbstractChartModel {
    structure: Structure;
    nbreEmploye: string;
    nbrHomme: string;
    nbrFemme: string;
}
