import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RadioTaxiPage } from './radio-taxi.page';

describe('RadioTaxiPage', () => {
  let component: RadioTaxiPage;
  let fixture: ComponentFixture<RadioTaxiPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RadioTaxiPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RadioTaxiPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
