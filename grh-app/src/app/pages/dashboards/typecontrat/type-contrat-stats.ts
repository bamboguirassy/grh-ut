import { BamboAbstractChartModel } from "src/app/shared/classes/bambo-abstract-chart-model";
import { TypeContrat } from "../../parametrage/typecontrat/typecontrat";

export class TypeContratStats extends BamboAbstractChartModel {
    typeContrat: TypeContrat;
    nbreEmploye: string;
    
}