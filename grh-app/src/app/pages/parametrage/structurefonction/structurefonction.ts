import { FonctionEmploye } from '../../gestionemploye/fonctionemploye/fonctionemploye';
import { Structure } from '../structure/structure';
import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class StructureFonction extends BamboAbstractObject {
    etat: boolean;
    duree: number;
    structure: Structure;
    fonctionEmployes: FonctionEmploye[];
}
