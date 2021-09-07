import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ParkingModalPage } from './parking-modal.page';

describe('ParkingModalPage', () => {
  let component: ParkingModalPage;
  let fixture: ComponentFixture<ParkingModalPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ParkingModalPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ParkingModalPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
