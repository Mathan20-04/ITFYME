import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SubjectlistComponent } from './subjectlist.component';

describe('SubjectlistComponent', () => {
  let component: SubjectlistComponent;
  let fixture: ComponentFixture<SubjectlistComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SubjectlistComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SubjectlistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
