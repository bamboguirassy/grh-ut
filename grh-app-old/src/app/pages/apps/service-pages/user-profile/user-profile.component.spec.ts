import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';

import { PageUserProfileComponent } from './user-profile.component';

describe('PageUserProfileComponent', () => {
  let component: PageUserProfileComponent;
  let fixture: ComponentFixture<PageUserProfileComponent>;

  beforeEach(waitForAsync(() => {
    TestBed.configureTestingModule({
      declarations: [ PageUserProfileComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PageUserProfileComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
