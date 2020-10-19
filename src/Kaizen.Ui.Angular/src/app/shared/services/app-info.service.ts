import { Injectable } from '@angular/core';

@Injectable()
export class AppInfoService {
  constructor() { }

  public get title(): string {
    return 'Kaizen';
  }

  public get currentYear(): number {
    return new Date().getFullYear();
  }
}
