import { Employe } from './../employe/employe';
import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class Adresse extends BamboAbstractObject {
    ville: string;
    quartier: string;
    etat: boolean;
    employe: Employe;
}
