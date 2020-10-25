import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { StubCrudServiceBase } from 'src/app/shared/services/stub-service-base';

import { Page } from '../../shared/models/shared-models';
import {
	SkillCategoryChangeActiveContract,
	SkillCategoryCreateContract,
	SkillCategoryItem,
	SkillCategoryUpdateContract
} from '../models/skill-models';
import { SkillService } from './skill.service';

@Injectable()
export class SkillServiceStub extends StubCrudServiceBase<SkillCategoryItem> implements SkillService {

	public toggleActive(contract: SkillCategoryChangeActiveContract): Observable<SkillCategoryItem> {
		const found = this.store.find(x => x.Id === contract.ToUpdate.Id);
		found.IsActive = contract.IsActive;
		return of(found);
	}

	public update(contract: SkillCategoryUpdateContract): Observable<SkillCategoryItem> {
		const found = this.store.find(x => x.Id === contract.ToUpdate.Id);
		Object.assign(found, contract);
		return of(found);
	}

	public create(contract: SkillCategoryCreateContract): Observable<SkillCategoryItem> {
		const stubForNew = { Id: this.getNextId(), IsActive: true, NodeType: 'skill-category' }

		const found = this.store.find(x => x.Name === contract.Name);
		if (found) {
			Object.assign(found, stubForNew);
			return of(found);
		}
		const clone: any = { ...contract };
		Object.assign(contract, clone);
		this.store.push(clone);
		return of(clone);
	}

	public query(): Observable<Page<SkillCategoryItem>> {
		return of({
			TotalCount: this.store.length,
			Items: this.store
		});
	}

	protected fillStore(): SkillCategoryItem[] {
		return [
			{
				Id: this.getNextId(),
				Name: 'test name',
				ShortDescription: 'test description',
				IsActive: true,
				NodeType: 'skill-category',
				IsSelected: false
			},
			{
				Id: this.getNextId(),
				Name: 'test name2',
				ShortDescription: 'test description2',
				IsActive: true,
				NodeType: 'skill-category',
				IsSelected: false
			},
			{
				Id: this.getNextId(),
				Name: 'test name3',
				ShortDescription: 'test description3',
				IsActive: true,
				NodeType: 'skill-category',
				IsSelected: false
			}
		];
	}

}
