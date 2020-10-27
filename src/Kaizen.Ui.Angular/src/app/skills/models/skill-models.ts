
export interface SkillBase {
	Id: number;
	Name: string;
	ShortDescription: string;
	IsActive: boolean;
}

export interface SkillCategoryItem extends TreeNode<SkillItem>, SkillBase {
}

export interface SkillItem extends TreeNode<SkillLevelItem>, SkillBase {
}

export interface SkillLevelItem extends TreeNode<void>, SkillBase {
	FullDescription?: string;
	Weight?: number;
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

export interface SkillCategoryCreateContract {
	Name?: string;
	ShortDescription?: string;
}

export interface SkillCategoryUpdateContract {
	Name?: string;
	ShortDescription?: string;
	IsActive?: boolean;
	ToUpdate: { Id: number };
}

export interface SkillCategoryChangeActiveContract {
	IsActive?: boolean;
	ToUpdate: { Id: number };
}

export interface SkillCreateContract {
	Name?: string;
	ShortDescription?: string;
	Parent: { Id: number }
}

export interface SkillUpdateContract {
	Name?: string;
	ShortDescription?: string;
	IsActive?: boolean;
	ToUpdate: { Id: number };
}

export interface SkillChangeActiveContract {
	IsActive?: boolean;
	ToUpdate: { Id: number };
}

export interface SkillLevelCreateContract {
	Name?: string;
	ShortDescription?: string;
	Parent: { Id: number };
	Weight?: number;
	FullDescription?: string;
}

export interface SkillLevelUpdateContract {
	Name?: string;
	ShortDescription?: string;
	Weight: number;
	FullDescription: string;
	IsActive?: boolean;
	ToUpdate: { Id: number };
}

export interface SkillLevelChangeActiveContract {
	IsActive?: boolean;
	ToUpdate: { Id: number };
}
