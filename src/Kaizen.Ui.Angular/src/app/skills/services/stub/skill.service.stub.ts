import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';

import { Page } from '../../../shared/models/shared-models';
import { SkillCategoryCreateContract, SkillCategoryItem, SkillCategoryUpdateContract } from '../../models/skill-models';
import { SkillService } from '../skill.service';

@Injectable()
export class SkillServiceStub extends SkillService {

	public update(contract: SkillCategoryUpdateContract): Observable<SkillCategoryItem> {
		return of({
			Id: 5,
			Name: 'test name5',
			ShortDescription: 'test description5',
			IsActive: true,
			NodeType: 'skill-category',
			IsSelected: false
		});
	}

	public create(contract: SkillCategoryCreateContract): Observable<SkillCategoryItem> {
		return of({
			Id: 4,
			Name: 'test name4',
			ShortDescription: 'test description4',
			IsActive: true,
			NodeType: 'skill-category',
			IsSelected: false
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
					IsActive: true,
					NodeType: 'skill-category',
					IsSelected: false
				},
				{
					Id: 2,
					Name: 'test name2',
					ShortDescription: 'test description2',
					IsActive: true,
					NodeType: 'skill-category',
					IsSelected: false
				},
				{
					Id: 3,
					Name: 'test name3',
					ShortDescription: 'test description3',
					IsActive: true,
					NodeType: 'skill-category',
					IsSelected: false
				}
			]
		});
	}
}
