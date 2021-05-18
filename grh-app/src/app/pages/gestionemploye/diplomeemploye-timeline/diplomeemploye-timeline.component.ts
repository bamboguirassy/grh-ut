import { Component, Input, OnInit } from '@angular/core';
import { SETTINGS } from 'src/environments/settings';
import { DiplomeEmploye } from '../diplomeemploye/diplomeemploye';
import { DiplomeEmployeService } from '../diplomeemploye/diplomeemploye.service';
import { Employe } from '../employe/employe';
import { EmployeService } from '../employe/employe.service';

@Component({
  selector: 'app-diplomeemploye-timeline',
  templateUrl: './diplomeemploye-timeline.component.html',
  styleUrls: ['./diplomeemploye-timeline.component.scss']
})
export class DiplomeemployeTimelineComponent implements OnInit {
  @Input() employe: Employe
  @Input() diplomeEmploye :DiplomeEmploye ;
  items:  Document[] = [];
  lightGradient = ['#fff', SETTINGS.topbarBg];
  tab = [];
    constructor(public employeSrv: EmployeService ,public diplomeEmployeSrv: DiplomeEmployeService) { }
  
    ngOnInit(): void {
      this.findByEmploye();
    }

    findByEmploye() {
      this.diplomeEmployeSrv.findByEmploye(this.employe)
      .subscribe((data: any)=>{
        this.items = data;  
        this.setTimeline();
      },err=>this.diplomeEmployeSrv.httpSrv.catchError(err));
    }

    setTimeline() {
      const sectionData = this.items.map((i: any) => ({
       date: i.anneeObtention?i.anneeObtention:"encours",
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
