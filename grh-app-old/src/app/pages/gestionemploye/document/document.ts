import { TypeDocument } from './../../parametrage/typedocument/typedocument';
import { Employe } from './../employe/employe';
import { BamboAbstractObject } from './../../../shared/classes/bambo-abstract-object';

export class Document extends BamboAbstractObject {
    nom: string;
    filename: string;
    filepath: string;
    employe: Employe;
    typeDocument: TypeDocument;
}
