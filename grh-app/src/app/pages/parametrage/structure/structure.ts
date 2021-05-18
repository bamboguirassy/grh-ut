import { TypeEntite } from './../typeentite/typeentite';
import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';
import { StructureFonction } from '../structurefonction/structurefonction';

export class Structure extends BamboAbstractObject {
    nom: string;
    code: string;
    adresse: string;
    telephone: string;
    structureParente: Structure;
    typeEntite: TypeEntite;
    structureFonctions: StructureFonction[];
    children: Structure[];
}
