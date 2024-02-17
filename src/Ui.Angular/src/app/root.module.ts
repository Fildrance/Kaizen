import { BrowserModule } from '@angular/platform-browser';
import { APP_INITIALIZER, NgModule } from '@angular/core';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { KeycloakAngularModule, KeycloakService, KeycloakBearerInterceptor } from 'keycloak-angular';

import { AppRoutingModule } from './app-routing.module';
import { RootComponent } from './root.component';
import { SideNavInnerToolbarModule } from './layouts/side-nav-inner-toolbar/side-nav-inner-toolbar.component';
import { SingleCardModule } from './layouts/single-card/single-card.component';
import { ScreenService } from './shared/services/screen.service';
import { AppInfoService } from './shared/services/app-info.service';


function initializeKeycloak(keycloak: KeycloakService) {
	return () =>
		keycloak.init({
			config: {
				url: 'http://localhost:8080',
				realm: 'kaizen-realm',
				clientId: 'kaizen-client'
			},
			initOptions: {
				onLoad: 'check-sso',
				silentCheckSsoRedirectUri:
					window.location.origin + '/assets/silent-check-sso.html'
			},
			shouldAddToken: (request) => {
				const { method, url } = request;

				const isGetRequest = 'GET' === method.toUpperCase();
				const acceptablePaths = ['/assets', '/clients/public'];
				const isAcceptablePathMatch = acceptablePaths.some((path) =>
					url.includes(path)
				);

				let f =  !(isGetRequest && isAcceptablePathMatch);
				return f;
			},
			shouldUpdateToken(request) {
				// @ts-ignore
				return !request.headers.get('token-update') === 'false';
			}
		});
}

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
		NgbModule,
		KeycloakAngularModule
	],
	providers: [
		ScreenService,
		AppInfoService,
		{
			provide: HTTP_INTERCEPTORS,
			useClass: KeycloakBearerInterceptor,
			multi: true
		},
		{
			provide: APP_INITIALIZER,
			useFactory: initializeKeycloak,
			multi: true,
			deps: [KeycloakService]
		}
	],
	bootstrap: [RootComponent]
})
export class RootModule {

}

