import { InjectionToken } from '@angular/core';
import { Observable } from 'rxjs';

import { Page } from '../../shared/models/shared-models';
import {
	SkillCategoryChangeActiveContract,
	SkillCategoryCreateContract,
	SkillCategoryItem,
	SkillCategoryUpdateContract,
	SkillChangeActiveContract,
	SkillCreateContract,
	SkillItem,
	SkillLevelChangeActiveContract,
	SkillLevelCreateContract,
	SkillLevelItem,
	SkillLevelUpdateContract,
	SkillUpdateContract
} from '../models/skill-models';

export const SkillServiceToken = new InjectionToken<SkillService>('SkillServiceInterface')

export interface SkillService {
	createCategory(contract: SkillCategoryCreateContract): Observable<SkillCategoryItem>;

	updateCategory(contract: SkillCategoryUpdateContract): Observable<SkillCategoryItem>;

	toggleActiveCategory(contract: SkillCategoryChangeActiveContract): Observable<SkillCategoryItem>;

	createSkill(contract: SkillCreateContract): Observable<SkillItem>;

	updateSkill(contract: SkillUpdateContract): Observable<SkillItem>;

	toggleActiveSkill(contract: SkillChangeActiveContract): Observable<SkillItem>;

	createSkillLevel(contract: SkillLevelCreateContract): Observable<SkillLevelItem>;

	updateSkillLevel(contract: SkillLevelUpdateContract): Observable<SkillLevelItem>;

	toggleActiveSkillLevel(contract: SkillLevelChangeActiveContract): Observable<SkillLevelItem>;

	query(): Observable<Page<SkillCategoryItem>>;
}
