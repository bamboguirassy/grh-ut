import { Grade } from '../../gestiongrade/grade/grade';
import { CaisseSociale } from '../../parametrage/caissesociale/caissesociale';
import { MutuelleSante } from '../../parametrage/mutuellesante/mutuellesante';
import { Pays } from '../../parametrage/pays/pays';
import { Profession } from '../../parametrage/profession/profession';
import { Structure } from '../../parametrage/structure/structure';
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
    indice: Grade;
    structure: Structure;
    datePriseService: string;
    dateSortie: string;
    motifSortie: string;
    numeroMainOeuvre: string;
    numeroAffiliationIpres: string;
    profession: Profession;
    commentaireSortie: string;
    grade: string;
    diplomeAcademique: string;


    // Champ temporaire
    globalFilter: string;
}
