import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
	templateUrl: 'admin.component.html',
	styleUrls: ['./admin.component.scss']
})
export class AdminComponent {

	public adminTabs: Array<Tab> = [
		{ text: 'skills', route: 'skill' },
		{ text: 'ways', route: 'way' },
		{ text: 'users to ways', route: 'user-way' },
	];
	public selectedIndex: number;

	constructor(private router: Router, activeRoute: ActivatedRoute) {
		if (activeRoute.firstChild) {
			const subRoute = activeRoute.firstChild.routeConfig.path;
			this.selectedIndex = this.adminTabs.findIndex(x => x.route === subRoute);
		}
	}

	public selectTab($event: { itemData: Tab }): void {
		this.router.navigate([$event.itemData.route]);
	}
}

class Tab {
	text: string;
	route: string;
}
