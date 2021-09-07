import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LineInformationPage } from './line-information.page';

describe('LineInformationPage', () => {
  let component: LineInformationPage;
  let fixture: ComponentFixture<LineInformationPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LineInformationPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LineInformationPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
