import { TestBed } from '@angular/core/testing';

import { KaypiServices } from './kaypi.service';

describe('KaypiServicesService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: KaypiServices = TestBed.get(KaypiServices);
    expect(service).toBeTruthy();
  });
});
