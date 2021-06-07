import { Component, OnInit } from '@angular/core';
import { BamboAuthService } from 'src/app/shared/services/bambo-auth.service';
import { Content } from 'src/app/ui/interfaces/modal';
import { TCModalService } from 'src/app/ui/services/modal/modal.service';


@Component({
  selector: 'page-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.scss']
})
export class PageSignInComponent implements OnInit {

  email = '';
  constructor(
    public authSrv: BamboAuthService,
    private modal: TCModalService,
  ) { }

  ngOnInit() { }


  sendResetPasswordLink(){
    this.authSrv.sendPasswordRequest('');
  }

  toogleResetPasswordModal<T>(body: Content<T>, header: Content<T> = null, footer: Content<T> = null, options: any = null){
    this.modal.open({
      body,
      header,
      footer,
      options
    });
    //
  }

  closeModal() {
    this.modal.close();
  }
}
