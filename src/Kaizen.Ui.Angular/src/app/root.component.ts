import { Component, HostBinding } from '@angular/core';
import { ScreenService, AppInfoService } from './shared/services';

@Component({
  selector: 'app-root',
  templateUrl: './root.component.html',
  styleUrls: ['./root.component.scss']
})
export class RootComponent {

  @HostBinding('class') get getClass() {
    return Object.keys(this.screen.sizes)
      .filter(cl => this.screen.sizes[cl]).join(' ');
  }

  constructor( private screen: ScreenService, public appInfo: AppInfoService) { }

}
