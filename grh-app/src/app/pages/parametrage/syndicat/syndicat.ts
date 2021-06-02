import { TypeEmploye } from './../typeemploye/typeemploye';
import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class Syndicat extends BamboAbstractObject {
    nom: string;
    code: string;
    type: string;
    filename: string;
    filepath: string;
    montantCotisationMensuelle: string;
    typeEmploye: TypeEmploye;
}
