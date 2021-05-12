import { TypeEmploye } from '../../parametrage/typeemploye/typeemploye';
import { GCategorie } from '../gcategorie/gcategorie';
import { GNiveau } from '../gniveau/gniveau';
import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class GClasse extends BamboAbstractObject {
    nom: string;
    indice: string;
    ordre: number;
    suivant: GClasse;
    categories: GCategorie[];
    niveaux: GNiveau[];
    typeEmploye: TypeEmploye;

}
