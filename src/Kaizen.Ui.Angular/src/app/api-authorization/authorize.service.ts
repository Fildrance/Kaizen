import { Injectable } from '@angular/core';
import { UserManager, UserManagerSettings, User } from 'oidc-client';
import { from, Observable, ReplaySubject, Subject } from 'rxjs';
import { map, switchMap, tap } from 'rxjs/operators';

@Injectable({
	providedIn: 'root'
})
export class AuthService {

	private manager$: Subject<UserManager> = new ReplaySubject<UserManager>(1);
	private user: Subject<User> = new ReplaySubject<User>(1);

	constructor() {
		// todo: replace with call for specific client
		const relativeUri = '/api/_configuration' 
		from(fetch(relativeUri))
			.pipe(
				tap(x => {
					if (!x.ok) {
						throw new Error(`Could not load settings for spa application`);
					}
				}),
				switchMap(x => x.json()),
				map(x => {
					const settings: any = x;
					const manager = new UserManager(settings);
					manager.getUser().then(user => {
						this.user.next(user);
					});
					return manager;
				})
			).subscribe(x => this.manager$.next(x));
	}

	public isLoggedIn(): Observable<boolean> {
		return this.getUser()
			.pipe(
				map(user => user != null && !user.expired)
			);
	}

	public startAuthentication(): Observable<void> {
		return this.manager$.pipe(
			switchMap(x => from(x.signinRedirect()))
		);
	}

	public completeAuthentication(): Observable<User> {

		return this.manager$.pipe(
			switchMap(x => from(x.signinRedirectCallback())),
			tap(x => this.user.next(x)),
			switchMap(x => this.getUser())
		);
	}

	public getUser(): Observable<User> {
		return this.user.asObservable();
	}
}

