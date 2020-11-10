import { Injectable, OnDestroy } from '@angular/core';
import { CanActivate } from '@angular/router';
import { Observable, Subscription } from 'rxjs';
import { tap } from 'rxjs/operators';

import { AuthService } from './authorize.service';

@Injectable({
	providedIn: 'root'
})
export class AuthGuard implements CanActivate, OnDestroy {

	private subscriptions = new Subscription();

	constructor(private authService: AuthService) { }

	public ngOnDestroy(): void {
		this.subscriptions.unsubscribe();
	}

	public canActivate(): Observable<boolean> {
		return this.authService.isLoggedIn()
			.pipe(
				tap(x => {
					if (!x) {
						this.subscriptions.add(
							this.authService.startAuthentication().subscribe()
						);
					}
				})
			);
	}
}
