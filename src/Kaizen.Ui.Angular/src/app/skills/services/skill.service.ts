import { Observable } from 'rxjs';

import { Page } from '../../shared/models/shared-models';
import { SkillCategoryCreateContract, SkillCategoryItem, SkillCategoryUpdateContract } from '../models/skill-models';

export abstract class SkillService {
	public abstract create(contract: SkillCategoryCreateContract): Observable<SkillCategoryItem>;

	public abstract query(): Observable<Page<SkillCategoryItem>>;

	public abstract update(contract: SkillCategoryUpdateContract): Observable<SkillCategoryItem>;
}


