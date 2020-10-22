import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

import { AppRoutingModule } from './app-routing.module';
import { RootComponent } from './root.component';
import { SideNavInnerToolbarModule } from './layouts/side-nav-inner-toolbar/side-nav-inner-toolbar.component';
import { SingleCardModule } from './layouts/single-card/single-card.component';
import { ScreenService } from './shared/services/screen.service';
import { AppInfoService } from './shared/services/app-info.service';

@NgModule({
	declarations: [
		RootComponent
	],
	imports: [
		BrowserModule,
		SideNavInnerToolbarModule,
		SingleCardModule,
		AppRoutingModule,
		HttpClientModule,
		NgbModule
	],
	providers: [ScreenService, AppInfoService],
	bootstrap: [RootComponent]
})
export class RootModule { }
