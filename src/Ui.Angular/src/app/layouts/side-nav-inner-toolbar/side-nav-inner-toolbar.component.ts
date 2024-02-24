import { Component, OnInit, NgModule, Input, ViewChild } from '@angular/core';
import { DxDrawerModule } from 'devextreme-angular/ui/drawer';
import { DxScrollViewModule, DxScrollViewComponent } from 'devextreme-angular/ui/scroll-view';
import { DxToolbarModule } from 'devextreme-angular/ui/toolbar';
import { CommonModule } from '@angular/common';

import { Router, NavigationEnd } from '@angular/router';
import { HeaderModule } from '../header/header.component';
import { ScreenService } from 'src/app/shared/services/screen.service';

@Component({
	selector: 'app-side-nav-inner-toolbar',
	templateUrl: './side-nav-inner-toolbar.component.html',
	styleUrls: ['./side-nav-inner-toolbar.component.scss']
})
export class SideNavInnerToolbarComponent implements OnInit {
	@ViewChild(DxScrollViewComponent, { static: true }) scrollView: DxScrollViewComponent;
	selectedRoute = '';

	menuOpened: boolean = false;
	temporaryMenuOpened = false;

	@Input()
	title: string;

	menuMode = 'shrink';
	menuRevealMode = 'expand';
	minMenuSize = 0;
	shaderEnabled = false;

	constructor(private screen: ScreenService, private router: Router) { }

	ngOnInit(): void {
		this.menuOpened = false; // this.screen.sizes['screen-large'];

		this.router.events.subscribe(val => {
			if (val instanceof NavigationEnd) {
				this.selectedRoute = val.urlAfterRedirects.split('?')[0];
			}
		});

		this.screen.changed.subscribe(() => this.updateDrawer());

		this.updateDrawer();
	}

	updateDrawer(): void {
		const isXSmall = this.screen.sizes['screen-x-small'];
		const isLarge = this.screen.sizes['screen-large'];

		this.menuMode = isLarge ? 'shrink' : 'overlap';
		this.menuRevealMode = isXSmall ? 'slide' : 'expand';
		this.minMenuSize = isXSmall ? 0 : 40;
		this.shaderEnabled = !isLarge;
	}

	toggleMenu = (e) => {
		this.menuOpened = !this.menuOpened;
		e.event.stopPropagation();
	}

	get hideMenuAfterNavigation(): boolean {
		return this.menuMode === 'overlap' || this.temporaryMenuOpened;
	}

	get showMenuAfterClick(): boolean {
		return !this.menuOpened;
	}

	navigationChanged(event): void {
		const path = event.itemData.path;
		const pointerEvent = event.event;

		if (path && this.menuOpened) {
			if (event.node.selected) {
				pointerEvent.preventDefault();
			} else {
				this.router.navigate([path]);
				this.scrollView.instance.scrollTo(0);
			}

			if (this.hideMenuAfterNavigation) {
				this.temporaryMenuOpened = false;
				this.menuOpened = false;
				pointerEvent.stopPropagation();
			}
		} else {
			pointerEvent.preventDefault();
		}
	}

	navigationClick(): void {
		if (this.showMenuAfterClick) {
			this.temporaryMenuOpened = true;
			this.menuOpened = true;
		}
	}
}

@NgModule({
	imports: [DxDrawerModule, DxToolbarModule, DxScrollViewModule, CommonModule, HeaderModule],
	exports: [SideNavInnerToolbarComponent],
	declarations: [SideNavInnerToolbarComponent]
})
export class SideNavInnerToolbarModule { }
