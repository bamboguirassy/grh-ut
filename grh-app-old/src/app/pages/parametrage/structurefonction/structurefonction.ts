import { Fonction } from '../fonction/fonction';
import { Structure } from '../structure/structure';
import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class StructureFonction extends BamboAbstractObject {
    etat: boolean;
    structure: Structure;
    fonction: Fonction;
}
