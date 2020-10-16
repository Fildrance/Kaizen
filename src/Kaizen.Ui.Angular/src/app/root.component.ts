import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  templateUrl: './root.component.html',
  styleUrls: ['./root.component.scss']
})
export class RootComponent implements OnInit {
  public temps = 'loading temps...';
  constructor(private client: HttpClient) {

  }
  public ngOnInit(): void {
    this.client.get<Array<{ temperatureC: number }>>('/api/weather')
      .subscribe(x => {
        const joined = x.map(t => t.temperatureC.toString()).join(',');
        this.temps = joined;
      });
  }
}
