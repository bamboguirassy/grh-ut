import { GClasse } from '../../gestiongrade/gclasse/gclasse';
import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class Profession extends BamboAbstractObject {
    nom: string;
    classe: GClasse;
}
