import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { StrategicPointsPage } from './strategic-points.page';

describe('StrategicPointsPage', () => {
  let component: StrategicPointsPage;
  let fixture: ComponentFixture<StrategicPointsPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ StrategicPointsPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(StrategicPointsPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
