import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  templateUrl: './root.component.html',
  styleUrls: ['./root.component.scss']
})
export class RootComponent implements OnInit {

  public temps = 'no data...';

  constructor(private client: HttpClient) {

  }
  public ngOnInit(): void {

  }

  public doStuff(): void {
    const contract: SkillCategoryCreateContract = { Name: 'n1', ShortDescription: 'this is short description' };
    this.client.post<SkillCategoryItem>('/api/skill-category', contract)
      .subscribe(x => {
        console.log('i got data');
        console.log(x);
        this.temps = x.Name;
      });
  }
}

export interface SkillCategoryItem {
  Id: number;
  Name: string;
  ShortDescription: string;
}

export interface SkillCategoryCreateContract {
  Name: string;
  ShortDescription: string;
}
