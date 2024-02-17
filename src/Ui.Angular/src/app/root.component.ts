import { Component, HostBinding } from '@angular/core';
import { AppInfoService } from './shared/services/app-info.service';
import { ScreenService } from './shared/services/screen.service';

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

	constructor(private screen: ScreenService, public appInfo: AppInfoService) { }

}
