import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class Pays extends BamboAbstractObject {
    code: string;
    alpha2: string;
    alpha3: string;
    nomEnGb: string;
    nomFrFr: string;
    nationalite: string;
}
