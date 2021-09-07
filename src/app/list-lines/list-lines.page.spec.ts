import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ListLinesPage } from './list-lines.page';

describe('ListLinesPage', () => {
  let component: ListLinesPage;
  let fixture: ComponentFixture<ListLinesPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ListLinesPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ListLinesPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
