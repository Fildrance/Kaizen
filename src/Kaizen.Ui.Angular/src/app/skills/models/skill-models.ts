
export interface SkillCategoryItem {
	Id: number;
	Name: string;
	ShortDescription: string;
	IsActive: boolean;
}

export interface SkillCategoryCreateContract {
	Name?: string;
	ShortDescription?: string;
}
