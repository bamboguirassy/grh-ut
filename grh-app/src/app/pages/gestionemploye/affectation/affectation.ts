import { Structure } from 'src/app/pages/parametrage/structure/structure';
import { Employe } from './../employe/employe';
import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class Affectation extends BamboAbstractObject {
    employe: Employe;
    structure: Structure;
    date: string;
    motif: string;
    poste: string;
    etat: boolean;
}
