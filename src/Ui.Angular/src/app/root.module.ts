import { BrowserModule } from '@angular/platform-browser';
import { APP_INITIALIZER, NgModule } from '@angular/core';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { KeycloakAngularModule, KeycloakService, KeycloakBearerInterceptor } from 'keycloak-angular';

import { AppRoutingModule } from './app-routing.module';
import { RootComponent } from './root.component';
import { SideNavInnerToolbarModule } from './layouts/side-nav-inner-toolbar/side-nav-inner-toolbar.component';
import { ScreenService } from './shared/services/screen.service';
import { AppInfoService } from './shared/services/app-info.service';
import { SkillModule } from './skills/skill.module';
import { ApiModule } from './shared/generated/api.module';
import { BASE_PATH } from './shared/generated/variables';
import { environment } from '../environments/environment';
import { CacheDroppingHttpInterceptor } from './shared/services/cache-dropping-http-interceptor';
import { CacheService } from './shared/services/cache-managing.service';


function initializeKeycloak(keycloak: KeycloakService) {
	return () =>
		keycloak.init({
			config: {
				url: 'http://localhost:8080',
				realm: 'kaizen',
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

				let f = !(isGetRequest && isAcceptablePathMatch);
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
		AppRoutingModule,
		HttpClientModule,
		NgbModule,
		KeycloakAngularModule,
		SkillModule,
		ApiModule
	],
	providers: [
		ScreenService,
		CacheService,
		{ provide: BASE_PATH, useValue: environment.apiUrl },
		AppInfoService,
		{
			provide: HTTP_INTERCEPTORS,
			useClass: KeycloakBearerInterceptor,
			multi: true
		},
		{
			provide: HTTP_INTERCEPTORS,
			useClass: CacheDroppingHttpInterceptor,
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

