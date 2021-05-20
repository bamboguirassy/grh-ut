import { BamboAbstractChartModel } from "src/app/shared/classes/bambo-abstract-chart-model";
import { TypeEmploye } from "../../parametrage/typeemploye/typeemploye";

export class TypeEmployeStats extends BamboAbstractChartModel {
    typeEmploye: TypeEmploye;
    nbreEmploye: string;
    nbrHomme: string;
    nbrFemme: string;
}