import { TypeEntite } from './../typeentite/typeentite';
import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class Structure extends BamboAbstractObject {
    nom: string;
    code: string;
    adresse: string;
    telephone: string;
    structureParente: Structure;
    typeEntite: TypeEntite;
}
