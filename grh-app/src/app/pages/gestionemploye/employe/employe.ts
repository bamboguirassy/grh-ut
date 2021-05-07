import { Grade } from '../../gestiongrade/grade/grade';
import { CaisseSociale } from '../../parametrage/caissesociale/caissesociale';
import { MutuelleSante } from '../../parametrage/mutuellesante/mutuellesante';
import { Pays } from '../../parametrage/pays/pays';
import { TypeEmploye } from '../../parametrage/typeemploye/typeemploye';
import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class Employe extends BamboAbstractObject {
    prenoms: string;
    nom: string;
    dateNaissance: string;
    lieuNaissance: string;
    cni: string;
    matricule: string;
    matriculeCaisseSociale: string;
    dateRecrutement: string;
    situtationMatrimoniale: string;
    retraite: boolean;
    genre: string;
    etat: boolean;
    emailUniv: string;
    email: string;
    filename: string;
    filepath: string;
    telephonePrimaire: string;
    telephoneSecondaire: string;
    typeEmploye: TypeEmploye;
    nationalite: Pays;
    caisseSociale: CaisseSociale;
    mutuelleSante: MutuelleSante;
    grade: Grade;
    datePriseService: string;
    dateSortie: string;
    motifSortie: string;
    numeroMainOeuvre: string;
}
