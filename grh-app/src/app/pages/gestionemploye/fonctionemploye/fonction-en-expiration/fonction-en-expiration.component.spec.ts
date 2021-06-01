import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FonctionEnExpirationComponent } from './fonction-en-expiration.component';

describe('FonctionEnExpirationComponent', () => {
  let component: FonctionEnExpirationComponent;
  let fixture: ComponentFixture<FonctionEnExpirationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FonctionEnExpirationComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FonctionEnExpirationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
