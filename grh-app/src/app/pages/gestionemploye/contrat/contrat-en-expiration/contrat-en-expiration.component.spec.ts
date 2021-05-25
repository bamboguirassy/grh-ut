import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ContratEnExpirationComponent } from './contrat-en-expiration.component';

describe('ContratEnExpirationComponent', () => {
  let component: ContratEnExpirationComponent;
  let fixture: ComponentFixture<ContratEnExpirationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ContratEnExpirationComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ContratEnExpirationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
