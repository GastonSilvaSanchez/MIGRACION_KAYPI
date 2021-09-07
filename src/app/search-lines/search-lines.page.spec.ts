import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SearchLinesPage } from './search-lines.page';

describe('SearchLinesPage', () => {
  let component: SearchLinesPage;
  let fixture: ComponentFixture<SearchLinesPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SearchLinesPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SearchLinesPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
