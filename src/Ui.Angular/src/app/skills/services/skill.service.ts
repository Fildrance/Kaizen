import { InjectionToken } from '@angular/core';
import { Observable } from 'rxjs';

import { Page } from 'src/app/shared/models/shared.models';
import {
	SkillCategoryCreateContract,
	SkillCategoryItem,
	SkillCategoryUpdateContract,
	SkillCategoryChangeActiveContract,
	SkillCreateContract,
	SkillItem,
	SkillUpdateContract,
	SkillChangeActiveContract,
	SkillLevelCreateContract,
	SkillLevelItem,
	SkillLevelUpdateContract,
	SkillLevelChangeActiveContract,
	SkillTreeItem
} from 'src/app/shared/models/skill.model';



export const SkillServiceToken = new InjectionToken<SkillService>('SkillServiceInterface')

export interface SkillService {
	findSkillLevel(Id: number): Observable<SkillLevelItem> ;

	findSkillCategory(Id: number): Observable<SkillCategoryItem> ;

	findSkill(Id: number): Observable<SkillItem> ;

	createCategory(contract: SkillCategoryCreateContract): Observable<SkillCategoryItem>;

	updateCategory(contract: SkillCategoryUpdateContract): Observable<SkillCategoryItem>;

	toggleActiveCategory(contract: SkillCategoryChangeActiveContract): Observable<SkillCategoryItem>;

	createSkill(contract: SkillCreateContract): Observable<SkillItem>;

	updateSkill(contract: SkillUpdateContract): Observable<SkillItem>;

	toggleActiveSkill(contract: SkillChangeActiveContract): Observable<SkillItem>;

	createSkillLevel(contract: SkillLevelCreateContract): Observable<SkillLevelItem>;

	updateSkillLevel(contract: SkillLevelUpdateContract): Observable<SkillLevelItem>;

	toggleActiveSkillLevel(contract: SkillLevelChangeActiveContract): Observable<SkillLevelItem>;

	query(): Observable<SkillTreeItem[]>;
}
