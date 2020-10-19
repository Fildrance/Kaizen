import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';

@Component({
  templateUrl: 'home.component.html',
  styleUrls: ['./home.component.scss']
})

export class HomeComponent {

  public contract: SkillCategoryCreateContract;
  public Id?: number;

  constructor(private client: HttpClient) {
    this.contract = {};
  }

  public save(): void {
    this.client.post<SkillCategoryItem>('/api/skill-category', this.contract)
      .subscribe(x => {
        console.log('i got data');
        console.log(x);
        this.Id = x.Id;
        console.log('saved data ' + x.Id + ' to ' + this.Id);
      });
  }
}

export interface SkillCategoryItem {
  Id: number;
  Name: string;
  ShortDescription: string;
}

export interface SkillCategoryCreateContract {
  Name?: string;
  ShortDescription?: string;
}
