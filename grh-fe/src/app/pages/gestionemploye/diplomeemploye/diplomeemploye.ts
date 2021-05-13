import { Employe } from './../employe/employe';
import { Diplome } from './../../parametrage/diplome/diplome';
import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class DiplomeEmploye extends BamboAbstractObject {
    diplome: Diplome;
    anneeObtention: string;
    etablissement: string;
    employe: Employe;
    formation: string;
}
