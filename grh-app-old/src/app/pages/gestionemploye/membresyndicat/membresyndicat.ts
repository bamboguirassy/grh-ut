import { Employe } from './../employe/employe';
import { Syndicat } from './../../parametrage/syndicat/syndicat';
import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class MembreSyndicat extends BamboAbstractObject {
    dateEnregistrement: string;
    etat: boolean;
    syndicat: Syndicat;
    employe: Employe;
}
