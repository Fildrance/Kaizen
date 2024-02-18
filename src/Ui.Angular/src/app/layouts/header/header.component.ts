import { Component, NgModule, Input, Output, EventEmitter, Inject } from '@angular/core';
import { CommonModule, DOCUMENT } from '@angular/common';

import { DxButtonModule } from 'devextreme-angular/ui/button';
import { DxToolbarModule } from 'devextreme-angular/ui/toolbar';

import { KeycloakService } from 'keycloak-angular';
import { DxDropDownButtonModule } from 'devextreme-angular';

@Component({
	selector: 'app-header',
	templateUrl: 'header.component.html',
	styleUrls: ['./header.component.scss']
})
export class HeaderComponent {
	@Output()
	menuToggle = new EventEmitter<boolean>();

	@Input()
	menuToggleEnabled = false;

	@Input()
	title: string;

	userName: string;

	profileOptions: ProfileOptionModel[] = [{ name: 'LogOut', icon: 'panelleft', action: () => this.logout() }];

	constructor(
		private keycloakService: KeycloakService,
		@Inject(DOCUMENT) private document: Document
	) {
		keycloakService.loadUserProfile()
			.then(x => this.userName = x.username);
	}

	toggleMenu = () => {
		this.menuToggle.emit();
	}

	public onProfileItemClick(e: { itemData: ProfileOptionModel }): void {
		if (!!e.itemData.action) {
			e.itemData.action();
		}
	}

	private logout() {
		this.keycloakService.logout(this.document.location.origin);
	}
}

@NgModule({
	imports: [
		CommonModule,
		DxButtonModule,
		DxToolbarModule,
		DxDropDownButtonModule,
	],
	declarations: [HeaderComponent],
	exports: [HeaderComponent]
})
export class HeaderModule { }

class ProfileOptionModel {
	public name: string;
	public icon: string;
	public action: () => void;
}
