import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LinesPage } from './lines.page';

describe('LinesPage', () => {
  let component: LinesPage;
  let fixture: ComponentFixture<LinesPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LinesPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LinesPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
