import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';

import { Page } from '../../../shared/models/shared-models';
import { SkillCategoryCreateContract, SkillCategoryItem } from '../../models/skill-models';
import { SkillService } from '../skill.service';

@Injectable()
export class SkillServiceStub extends SkillService {
	public create(contract: SkillCategoryCreateContract): Observable<SkillCategoryItem> {
		return of({
			Id: 1,
			Name: 'test name',
			ShortDescription: 'test description',
			IsActive: true
		});
	}

	public query(): Observable<Page<SkillCategoryItem>> {
		return of({
			TotalCount: 3,
			Items: [
				{
					Id: 1,
					Name: 'test name',
					ShortDescription: 'test description',
					IsActive: true
				},
				{
					Id: 2,
					Name: 'test name2',
					ShortDescription: 'test description2',
					IsActive: true
				},
				{
					Id: 3,
					Name: 'test name3',
					ShortDescription: 'test description3',
					IsActive: true
				}
			]
		});
	}
}
