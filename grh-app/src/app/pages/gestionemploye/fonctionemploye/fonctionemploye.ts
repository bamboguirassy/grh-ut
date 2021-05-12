import { StructureFonction } from '../../parametrage/structurefonction/structurefonction';
import { Employe } from '../employe/employe';
import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class FonctionEmploye extends BamboAbstractObject {
    datePriseFonction: string;
    etat: boolean;
    responsabilite: StructureFonction;
    employe: Employe;
    dateFin: string;
}
