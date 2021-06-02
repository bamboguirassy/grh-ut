import { DatePipe } from '@angular/common';
import { Component, Input, OnInit } from '@angular/core';
import { SETTINGS } from 'src/environments/settings';
import { Employe } from '../../employe/employe';
import { Affectation } from '../affectation';
import { AffectationService } from '../affectation.service';

@Component({
  selector: 'app-affectation-timeline',
  templateUrl: './affectation-timeline.component.html',
  styleUrls: ['./affectation-timeline.component.scss']
})
export class AffectationTimelineComponent implements OnInit {
  @Input() employe: Employe;
  items: Affectation[]=[];
  @Input() affectations: any;
  tab = [];
  secondViewBorder = 'warning';
  lightGradient = ['#fff', SETTINGS.topbarBg];
  constructor( public affectationSrv: AffectationService, public datePipe: DatePipe) { }

  ngOnInit(): void {
     this.setTimeline();
  }

 
  setTimeline() {
    const sectionData = this.affectations.map((i: any) => ({
    date: `${i.date?`${this.datePipe.transform(`${i.date}`,'dd/MM/yyyy')}` :'Indefini'}`,
      title: i.structure.nom,
      content: i.poste,
      icon: "icofont-certificate-alt-2",
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
