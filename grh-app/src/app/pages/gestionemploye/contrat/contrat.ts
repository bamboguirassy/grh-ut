import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';
import { TypeContrat } from './../../parametrage/typecontrat/typecontrat';
import { Employe } from './../../gestionemploye/employe/employe'
export class Contrat extends BamboAbstractObject {
    dureeEnMois: number;
    dateFinEffective: string;
    motifFin: string;
    commentaireSurFinContrat: Text;
    etat: boolean;
    typeContrat: TypeContrat;
    employe: Employe;
    dateCreation: string;
    dateSignature: string;
    dateDebut: any;
    dateFinPrevue: any;
    numero: string;
}
