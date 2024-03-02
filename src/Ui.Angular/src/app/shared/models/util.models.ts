import { Injectable } from '@angular/core';
import { TreeItem } from './shared.models';
import { SkillAggregationLevel } from '../generated/model/skill-aggregation-level';

export class DxButtonOptions {
	icon?: string;
	type?: string;
	onClick: () => void;
	text?: string;
}

export interface TreeNodeViewModel<TChildType extends TreeNodeViewModel<any, TNodeTypeEnum>, TNodeTypeEnum> {

	set original(value: TreeItem<TNodeTypeEnum>);
	get Id(): number;
	get Name(): string;
	set Name(value: string)
	IsSelected?: boolean;
	IsExpanded?: boolean;
	get IsActive(): boolean;
	set IsActive(value: boolean);
	Items: TChildType[] | null;
	Parent: TreeNodeViewModel<any, TNodeTypeEnum> | null;
	get NodeType(): TNodeTypeEnum;
	ItemsFilter?: (items?: Array<TreeNodeViewModel<TChildType, TNodeTypeEnum>>) => void;
}

@Injectable()
export class RoutesByTypes {
	private reverse: Map<string, SkillAggregationLevel>;

	constructor(private routesByTypes: Map<SkillAggregationLevel, string>) {
		this.reverse = new Map<string, SkillAggregationLevel>();
		for (const [key, value] of routesByTypes) {
			this.reverse.set(value, key);
		}
	}

	public get(type: SkillAggregationLevel): string {
		return this.routesByTypes.get(type);
	}

	public getKeyFor(value: string): SkillAggregationLevel {
		return this.reverse.get(value);
	}
}
