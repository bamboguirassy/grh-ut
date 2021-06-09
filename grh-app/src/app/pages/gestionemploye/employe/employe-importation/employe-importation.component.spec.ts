import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EmployeImportationComponent } from './employe-importation.component';

describe('EmployeImportationComponent', () => {
  let component: EmployeImportationComponent;
  let fixture: ComponentFixture<EmployeImportationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EmployeImportationComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EmployeImportationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
