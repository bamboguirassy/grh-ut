import { DatePipe } from '@angular/common';
import { Component, Input, OnInit } from '@angular/core';
import { SETTINGS } from 'src/environments/settings';
import { Employe } from '../../employe/employe';
import { EmployeService } from '../../employe/employe.service';
import { FonctionEmploye } from '../fonctionemploye';

@Component({
  selector: 'app-fonctionemploye-timeline',
  templateUrl: './fonctionemploye-timeline.component.html',
  styleUrls: ['./fonctionemploye-timeline.component.scss']
})
export class FonctionemployeTimelineComponent implements OnInit {
  @Input() employe: Employe;
  items: FonctionEmploye[]=[];
  @Input() set setItems(values){
    this.items = values;
    this.setTimeline();
  }

  lightGradient = ['#fff', SETTINGS.topbarBg];
  tab = [];
    constructor(public employeSrv: EmployeService, public datePipe: DatePipe) { }
  
    ngOnInit(): void {
      this.setTimeline();
   
    }
  
    setTimeline() {
      const sectionData = this.items.map((i: any) => ({
       date: `${i.datePriseFonction?`${this.datePipe.
        transform(`${i.datePriseFonction}` , 'dd/MM/yyyy')}`
        :'Indefini'} - ${i.etat?'En Cours'
        :`${i.dateFin?`${this.datePipe.transform(`${i.dateFin}`
         , 'dd/MM/yyyy')}`:'En Cours'}`}`,
        title: i.responsabilite.fonction.nom,
        content: i.responsabilite.structure.nom,
        icon: "icofont-business-man-alt-1",
        iconBg: SETTINGS.sidebarBg,
        iconColor: "#fff"
      }))
      this.tab = [
        {
          "sectionLabel": {
            "text": "Fonction Structure",
            "view": "error"
          },
          "sectionData": sectionData
        },
      ];
    }


}
