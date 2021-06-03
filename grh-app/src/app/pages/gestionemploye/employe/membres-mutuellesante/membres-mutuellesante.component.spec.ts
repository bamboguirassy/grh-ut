import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MembresMutuellesanteComponent } from './membres-mutuellesante.component';

describe('MembresMutuellesanteComponent', () => {
  let component: MembresMutuellesanteComponent;
  let fixture: ComponentFixture<MembresMutuellesanteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MembresMutuellesanteComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MembresMutuellesanteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
