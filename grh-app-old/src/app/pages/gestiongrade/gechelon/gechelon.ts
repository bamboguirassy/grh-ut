import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class GEchelon extends BamboAbstractObject {
    nom: string;
    indice: string;
    ordre: number;
    suivant:GEchelon;
}
