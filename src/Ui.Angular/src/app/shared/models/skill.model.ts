/* eslint-disable */
// TypeScriptContractGenerator's generated content
import { IList } from './shared.models';

export type SkillCategoryChangeActiveContract = {
	ToUpdate?: null | SkillCategorySelector;
	IsActive?: null | boolean;
};
export type SkillChangeActiveContract = {
	ToUpdate?: null | SkillSelector;
	IsActive?: null | boolean;
};
export type SkillLevelChangeActiveContract = {
	ToUpdate?: null | SkillLevelSelector;
	IsActive?: null | boolean;
};
export type SkillCategoryCreateContract = {
	Name?: null | string;
	ShortDescription?: null | string;
};
export type SkillCreateContract = {
	Name?: null | string;
	ShortDescription?: null | string;
	Parent:  SkillCategorySelector;
};
export type SkillLevelCreateContract = {
	Name?: null | string;
	ShortDescription?: null | string;
	Description?: null | string;
	Weight?: null | number;
	Parent: SkillSelector;
};
export type SkillCategoryFilterContract = {
	IncludeActive?: null | IncludeActiveOption;
	Take?: null | number;
	Skip?: null | number;
};
export type SkillCategoryUpdateContract = {
	Name?: null | string;
	ShortDescription?: null | string;
	IsActive?: null | boolean;
	ToUpdate: SkillCategorySelector;
};
export type SkillUpdateContract = {
	ToUpdate?: null | SkillSelector;
	Name?: null | string;
	ShortDescription?: null | string;
	IsActive?: null | boolean;
};
export type SkillLevelUpdateContract = {
	ToUpdate: SkillLevelSelector;
	Name?: null | string;
	ShortDescription?: null | string;
	IsActive?: null | boolean;
	Description?: null | string;
	Weight?: null | number;
};
export type SkillCategoryItem = {
	NodeType?: null | string;
	Items?: Array<null | SkillItem>;
	Id?: number;
	IsActive?: boolean;
	Name?: null | string;
	ShortDescription?: null | string;
};
export type SkillItem = {
	NodeType?: null | string;
	Items?: Array<null | SkillLevelItem>;
	Id?: number;
	IsActive?: boolean;
	Name?: null | string;
	ShortDescription?: null | string;
};
export type SkillLevelItem = {
	Weight?: number;
	Description?: null | string;
	NodeType?: null | string;
	Id?: number;
	IsActive?: boolean;
	Name?: null | string;
	ShortDescription?: null | string;
	Prerequisites: SkillLevelPrerequisiteItem[]
};
export type SkillCategorySelector = {
	Id?: null | number;
};
export type SkillSelector = {
	Id?: null | number;
};
export type SkillLevelSelector = {
	Id?: null | number;
};
export enum IncludeActiveOption {
	None = 'None',
	IncludeOnlyActive = 'IncludeOnlyActive',
	IncludeOnlyInactive = 'IncludeOnlyInactive',
	IncludeAll = 'IncludeAll',
}

export enum SkillAggregationLevel {
	None = 'None',
	SkillCategory = 'SkillCategory',
	Skill = 'Skill',
	SkillLevel = 'SkillLevel'
}

export interface SkillTreeItem extends TreeItem<SkillAggregationLevel> {
}

export interface TreeItem<T> {
	NodeType: string;
	Name: string;
	IsActive: boolean;
	Id: number;
	Items?: TreeItem<any>[]
}

export class SkillLevelPrerequisiteItem {
	PrerequisiteId: number;
	RequiredSkillId: number;
}

export class SkillBriefItem {
	Id: number;
	Name: string;
}
