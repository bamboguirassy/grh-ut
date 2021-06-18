import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';
import { StructureFonction } from '../structurefonction/structurefonction';

export class Structure extends BamboAbstractObject {
    nom: string;
    code: string;
    adresse: string;
    telephone: string;
    structureParente: Structure;
    structureFonctions: StructureFonction[];
    children: Structure[];
    etat: boolean;
}
