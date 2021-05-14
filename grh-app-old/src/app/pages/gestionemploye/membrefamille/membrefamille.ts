import { Employe } from './../employe/employe';
import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class MembreFamille extends BamboAbstractObject {
    prenoms: string;
    nom: string;
    dateNaissance: string;
    lieuNaissance: string;
    genre: string;
    lienParente: string;
    telephone: string;
    employe: Employe;
}
