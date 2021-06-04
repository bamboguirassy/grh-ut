import { DatePipe } from '@angular/common';
import { Component, Input, OnInit } from '@angular/core';
import { SETTINGS } from 'src/environments/settings';
import { Contrat } from '../contrat';
import { ContratService } from '../contrat.service';
import { Employe } from '../../employe/employe';

@Component({
  selector: 'app-contrat-timeline',
  templateUrl: './contrat-timeline.component.html',
  styleUrls: ['./contrat-timeline.component.scss']
})
export class ContratTimelineComponent implements OnInit {
  @Input() employe: Employe;
  items:Contrat[]=[];
  @Input() set setItems(values){
    this.items = values;
    this.setTimeline();
  }
  tab = [];
  secondViewBorder = 'warning';
  lightGradient = ['#fff', SETTINGS.topbarBg];
  constructor(public contratSrv: ContratService, public datePipe: DatePipe) { }

  ngOnInit(): void {
    this.setTimeline();
  }

  
  setTimeline() {
    const sectionData = this.items.map((i: any) => ({
      date: `${i.dateDebut?`${this.datePipe.
        transform(`${i.dateDebut}` , 'dd/MM/yyyy')}`
        :'Indefini'} - ${i.boolean?'En Cours'
        :`${i.dateFin?`${this.datePipe.transform(`${i.dateFin}`
         , 'dd/MM/yyyy')}`:'En Cours'}`}`,
     //date: i.anneeObtention?i.anneeObtention:"encours",
      title: i.typeContrat.nom,
      content: i.motifRupture,
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
