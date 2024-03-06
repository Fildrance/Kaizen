import { HttpInterceptor, HttpRequest, HttpHandler, HttpEvent, HttpResponse, HttpErrorResponse } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable, tap } from "rxjs";
import { invalidateCacheIfRequired } from "./cache-managing.service";

@Injectable()
export class CacheDroppingHttpInterceptor implements HttpInterceptor {
	constructor() { }

	intercept(
		req: HttpRequest<any>,
		next: HttpHandler
	): Observable<HttpEvent<any>> {
		return next.handle(req)
			.pipe(
				tap(
					(event) => {
						if (event instanceof HttpResponse) {
							invalidateCacheIfRequired(event.url)
						}
					}
				)
			);
	}
}
