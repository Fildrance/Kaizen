import { InjectionToken } from '@angular/core';
import { Observable } from 'rxjs';

import { Page } from '../../shared/models/shared-models';
import {
	SkillCategoryChangeActiveContract,
	SkillCategoryCreateContract,
	SkillCategoryItem,
	SkillCategoryUpdateContract
} from '../models/skill-models';

export const SkillServiceToken = new InjectionToken('SkillServiceInterface')

export interface SkillService {
	create(contract: SkillCategoryCreateContract): Observable<SkillCategoryItem>;

	query(): Observable<Page<SkillCategoryItem>>;

	update(contract: SkillCategoryUpdateContract): Observable<SkillCategoryItem>;

	toggleActive(contract: SkillCategoryChangeActiveContract): Observable<SkillCategoryItem>;
}


