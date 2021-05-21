import { Profession } from 'src/app/pages/parametrage/profession/profession';
import { BamboAbstractChartModel } from "src/app/shared/classes/bambo-abstract-chart-model";

export class ProfessionStats extends BamboAbstractChartModel {
    profession: Profession;
    nbreEmploye: string;
    nbrHomme: string;
    nbrFemme: string;
}
