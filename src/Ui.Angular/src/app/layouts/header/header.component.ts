import { Component, NgModule, Input, Output, EventEmitter, Inject } from '@angular/core';
import { CommonModule, DOCUMENT } from '@angular/common';

import { DxButtonModule } from 'devextreme-angular/ui/button';
import { DxToolbarModule } from 'devextreme-angular/ui/toolbar';

import { KeycloakService } from 'keycloak-angular';
import { DxDropDownButtonModule, DxMenuModule } from 'devextreme-angular';
import { Router } from '@angular/router';

class NavMenuItem {
	id: string;
	name: string;
	items?: NavMenuItem[]
}

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

	public profileOptions: ProfileOptionModel[] = [{ name: 'LogOut', icon: 'panelleft', action: () => this.logout() }];

	public navigationOptions: NavMenuItem[] = [
		{
			id: 'admin',
			name: 'Management',
			items: [
				{
					id: '/admin/skill-manager',
					name: 'Skills'
				},
				{
					id: '/admin/ways-manager',
					name: 'Ways'
				},
				{
					id: '/admin/users-to-ways',
					name: 'Users to ways'
				}
			]
		}
	];

	toggleMenu = () => {
		this.menuToggle.emit();
	}

	constructor(
		private keycloakService: KeycloakService,
		private router: Router,
		@Inject(DOCUMENT) private document: Document
	) {
		keycloakService.loadUserProfile()
			.then(x => this.userName = x.username);
	}

	public onNavigationItemClick(e: { itemData: NavMenuItem }): void {
		if (e.itemData.items) {
			return;
		}
		debugger;
		this.router.navigate([e.itemData.id])
	}

	public onProfileItemClick(e: { itemData: ProfileOptionModel }): void {
		if (!!e.itemData.action) {
			e.itemData.action();
		}
	}

	public goHome() {
		this.router.navigate(['/']);
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
		DxMenuModule,
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
