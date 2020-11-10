import { Component, OnDestroy, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Subscription } from 'rxjs';

import { AuthService } from '../authorize.service';

@Component({
	templateUrl: './auth-callback.component.html'
})
export class AuthCallbackComponent implements OnInit, OnDestroy {

	private subscription: Subscription = new Subscription();

	constructor(
		private authService: AuthService,
		private router: Router
	) { }

	public ngOnInit(): void {
		this.subscription.add(
			this.authService.completeAuthentication()
				.subscribe(x => {
					this.router.navigate(['/']);
				})
		);
	}

	public ngOnDestroy(): void {
		this.subscription.unsubscribe();
	}
}
