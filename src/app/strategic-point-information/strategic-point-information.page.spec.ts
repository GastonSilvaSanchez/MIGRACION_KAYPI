import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { StrategicPointInformationPage } from './strategic-point-information.page';

describe('StrategicPointInformationPage', () => {
  let component: StrategicPointInformationPage;
  let fixture: ComponentFixture<StrategicPointInformationPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ StrategicPointInformationPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(StrategicPointInformationPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
