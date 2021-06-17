import { CaisseSociale } from '../../parametrage/caissesociale/caissesociale';
import { Structure } from '../../parametrage/structure/structure';
import { TypeContrat } from '../../parametrage/typecontrat/typecontrat';
import { TypeEmploye } from '../../parametrage/typeemploye/typeemploye';

class DateRange {
    startDate: string;
    endDate: string;
}

export class EmployeSearchCriteria { 
    typeEmployes: TypeEmploye[];
    structures: Structure[]; 
    caisseSociales: CaisseSociale[];
    typeContrats: TypeContrat[];
    genre: string;
    recrutementDateRange: DateRange;
    priseServiceDateRange: DateRange;
}