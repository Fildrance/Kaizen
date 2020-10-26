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
	SkillUpdateContract
} from '../models/skill-models';

export const SkillServiceToken = new InjectionToken<SkillService>('SkillServiceInterface')

export interface SkillService {
	createCategory(contract: SkillCategoryCreateContract): Observable<SkillCategoryItem>;

	updateCategory(contract: SkillCategoryUpdateContract): Observable<SkillCategoryItem>;

	createSkill(contract: SkillCreateContract): Observable<SkillItem>;

	updateSkill(contract: SkillUpdateContract): Observable<SkillItem>;

	query(): Observable<Page<SkillCategoryItem>>;

	toggleActiveCategory(contract: SkillCategoryChangeActiveContract): Observable<SkillCategoryItem>;

	toggleActiveSkill(contract: SkillChangeActiveContract): Observable<SkillItem>;
}
