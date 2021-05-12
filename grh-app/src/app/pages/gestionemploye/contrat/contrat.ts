import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';
import{TypeContrat} from './../../parametrage/typecontrat/typecontrat';
import{Employe} from './../../gestionemploye/employe/employe'
export class Contrat extends BamboAbstractObject {
                                dureeEnMois: number;
                                etat: string;
                                dateRupture: string;
                                motifRupture: string;
                                expire: boolean;
                                rompu: boolean;
                                typeContrat:TypeContrat;
                                employe:Employe;


            }
