import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SubjectdetailComponent } from './subjectdetail.component';

describe('SubjectdetailComponent', () => {
  let component: SubjectdetailComponent;
  let fixture: ComponentFixture<SubjectdetailComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SubjectdetailComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SubjectdetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
