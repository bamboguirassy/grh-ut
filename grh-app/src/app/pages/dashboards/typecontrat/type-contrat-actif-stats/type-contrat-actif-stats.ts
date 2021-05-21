import {TypeContrat} from '../../../parametrage/typecontrat/typecontrat';
import { BamboAbstractChartModel } from "src/app/shared/classes/bambo-abstract-chart-model";

export class TypeContratActifStats extends BamboAbstractChartModel {
    typeContrat: TypeContrat;
    nbreEmploye: string;
    
}