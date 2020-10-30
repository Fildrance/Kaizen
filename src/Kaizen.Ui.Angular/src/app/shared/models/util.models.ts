import { Injectable } from '@angular/core';

export class DxButtonOptions {
	icon?: string;
	type?: string;
	onClick: () => void;
	text?: string;
}


export interface TreeNode<TChildType> {
	Id: number;
	Name: string;
	IsSelected?: boolean;
	IsActive: boolean;
	Items?: Array<TChildType>;
	Parent?: TreeNode<any>;
	NodeType?: string;
	ItemsFilter?: (items?: Array<TreeNode<TChildType>>) => void;
}

@Injectable()
export class RoutesByTypes {

	constructor(private routesByTypes: Map<string, string>) { }

	public get(type: string): string {
		return this.routesByTypes.get(type);
	}
}
