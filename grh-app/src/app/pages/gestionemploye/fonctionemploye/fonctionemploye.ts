import { Fonction } from '../../parametrage/fonction/fonction';
import { Structure } from '../../parametrage/structure/structure';
import { TypeContrat } from '../../parametrage/typecontrat/typecontrat';
import { Employe } from '../employe/employe';
import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class FonctionEmploye extends BamboAbstractObject {
    datePriseFonction: string;
    etat: boolean;
    fonction: Fonction;
    employe: Employe;
    structure: Structure;
    typeContrat: TypeContrat;
    dateFin: string;
}
