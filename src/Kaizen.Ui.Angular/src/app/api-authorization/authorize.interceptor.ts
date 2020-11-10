import { Injectable } from '@angular/core';
import { HttpInterceptor, HttpRequest, HttpHandler, HttpEvent } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AuthService } from './authorize.service';
import { first, last, map, mergeMap} from 'rxjs/operators';

@Injectable({
	providedIn: 'root'
})
export class AuthorizeInterceptor implements HttpInterceptor {
	constructor(private authorize: AuthService) { }

	// todo: handle access to resources that does not require authorization.
	public intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
		// omnissia blessed me with understanding of rxjs!
		return this.authorize.getUser()
			.pipe(
				map(x => x.access_token),
				mergeMap(token => {
					if (!!token && this.isSameOriginUrl(request)) {

						request = request.clone({
							setHeaders: {
								Authorization: `Bearer ${token}`
							}
						});
					}

					return next.handle(request).pipe(
						last()
					);
				}),
				first()
			);
	}

	private isSameOriginUrl(req: any): boolean {
		// It's an absolute url with the same origin.
		if (req.url.startsWith(`${window.location.origin}/`)) {
			return true;
		}

		// It's a protocol relative url with the same origin.
		// For example: //www.example.com/api/Products
		if (req.url.startsWith(`//${window.location.host}/`)) {
			return true;
		}

		// It's a relative url like /api/Products
		if (/^\/[^\/].*/.test(req.url)) {
			return true;
		}

		// It's an absolute or protocol relative url that
		// doesn't have the same origin.
		return false;
	}
}
