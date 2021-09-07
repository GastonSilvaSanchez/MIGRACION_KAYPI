import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DirectoriesPage } from './directories.page';

describe('DirectoriesPage', () => {
  let component: DirectoriesPage;
  let fixture: ComponentFixture<DirectoriesPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DirectoriesPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DirectoriesPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
