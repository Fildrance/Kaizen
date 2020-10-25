
export interface SkillBase {
	Id: number;
	Name: string;
	ShortDescription: string;
	IsActive: boolean;
}

export interface TreeNode {
	Id: number;
	Name: string;
	IsSelected?: boolean;
	IsActive: boolean;
	Items?: TreeNode[];
	NodeType?: string;
	ItemsFilter?: (items?: Array<TreeNode>) => void;
}

export interface SkillCategoryItem extends TreeNode, SkillBase {
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
