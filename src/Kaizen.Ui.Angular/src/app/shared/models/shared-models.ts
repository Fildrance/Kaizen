import { Injectable } from '@angular/core';

export interface Page<T> {
	Items: T[];
	TotalCount: number;
}

export class DxButtonOptions {
	icon?: string;
	type?: string;
	onClick: () => void;
	text?: string;
}

@Injectable()
export class RoutesByTypes {

	constructor(private routesByTypes: Map<string, string>) { }

	public get(type: string): string {
		return this.routesByTypes.get(type);
	}
}
