import { IPageData } from './page-data';
import { IAppSettings } from './settings';
import { Employe } from '../pages/gestionemploye/employe/employe';

export interface IAppState {
  pageData: IPageData;
  appSettings: IAppSettings,
  employes: Employe[]
}
