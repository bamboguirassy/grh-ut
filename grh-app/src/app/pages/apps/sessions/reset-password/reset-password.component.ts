import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'reset-password',
  templateUrl: './reset-password.component.html',
  styleUrls: ['./reset-password.component.scss']
})
export class PageResetPasswordComponent implements OnInit {

  token: string;
  email: string;
  constructor(
    public activatedRoute: ActivatedRoute,
  ) { }

  ngOnInit() {
    this.token = this.activatedRoute.snapshot.paramMap.get('token');
    this.email = this.activatedRoute.snapshot.paramMap.get('email');

  }

}
