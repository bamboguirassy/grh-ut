import { Component, Input, OnInit } from '@angular/core';
import { SETTINGS } from 'src/environments/settings';
import { DiplomeEmployeService } from '../diplomeemploye.service';
import { Employe } from '../../employe/employe';
import { EmployeService } from '../../employe/employe.service';
import { DiplomeEmploye } from '../diplomeemploye';

@Component({
  selector: 'app-diplomeemploye-timeline',
  templateUrl: './diplomeemploye-timeline.component.html',
  styleUrls: ['./diplomeemploye-timeline.component.scss']
})
export class DiplomeEmployeTimelineComponent implements OnInit {
  @Input() employe: Employe
  items:DiplomeEmploye[]=[];
  @Input() set setItems(values){
    this.items = values;
    this.setTimeline();
  }
 
  lightGradient = ['#fff', SETTINGS.topbarBg];
  tab = [];
  
    ngOnInit(): void {
      this.setTimeline();
    }

    
    setTimeline() {
      const sectionData = this.items.map((i: any) => ({
       date: i.anneeObtention ? i.anneeObtention:"Indéfinie",
        title: i.diplome.nom,
        content: i.formation,
        icon: "icofont-hat-alt",
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
