import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class Commission extends BamboAbstractObject {
    nom: string;
    missions: string;
    etat: boolean;
    description: string;
    dateCreation: string;
}
