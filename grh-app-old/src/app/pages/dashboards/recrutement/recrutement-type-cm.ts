import { BamboAbstractChartModel } from "../../../shared/classes/bambo-abstract-chart-model";
import { RecrutementStats } from "./recrutement-stats";

export class RecrutementTypeCM extends BamboAbstractChartModel {
    annee: string;
    recrutements: RecrutementStats[];
}