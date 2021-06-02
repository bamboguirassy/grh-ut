import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MembreCaisseSocialeComponent } from './membre-caisse-sociale.component';

describe('MembreCaisseSocialeComponent', () => {
  let component: MembreCaisseSocialeComponent;
  let fixture: ComponentFixture<MembreCaisseSocialeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MembreCaisseSocialeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MembreCaisseSocialeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
