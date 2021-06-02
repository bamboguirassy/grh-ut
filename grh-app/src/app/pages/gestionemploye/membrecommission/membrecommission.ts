import { Commission } from '../../parametrage/commission/commission';
import { Employe } from '../employe/employe';
import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class MembreCommission extends BamboAbstractObject {
    fonction: string;
    dateIntegration: string;
    statut: boolean;
    dateSortie: string;
    motifSortie: string;
    employe: Employe;
    commission: Commission;
}
