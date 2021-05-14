import { Component } from '@angular/core';
import { Spinkit } from 'ng-http-loader'; 
import { SETTINGS } from 'src/environments/settings';

@Component({
  selector: 'app-root',
  template: `
  <ng-http-loader 
    [backdrop]="false"
    [backgroundColor]="sidebarBg"
    [debounceDelay]="100"
    [extraDuration]="300"
    [minDuration]="300"
    [opacity]=".9"
    [spinner]="spinkit.skCubeGrid">
</ng-http-loader>
  <router-outlet></router-outlet>
  `
})
export class AppComponent {
  sidebarBg = SETTINGS.sidebarBg;
  public spinkit = Spinkit;

}
