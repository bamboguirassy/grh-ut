import { GCategorie } from '../gcategorie/gcategorie';
import { GEchelon } from '../gechelon/gechelon';
import { GNiveau } from '../gniveau/gniveau';
import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class Grade extends BamboAbstractObject {
    classification: string;
    echelon: GEchelon;
    niveau: GNiveau;
    categorie: GCategorie;
}
