import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { StubCrudServiceBase } from 'src/app/shared/services/stub-service-base';
import { HasId } from 'src/app/shared/services/utils.service';

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
import { SkillService } from './skill.service';

@Injectable()
export class SkillServiceStub extends StubCrudServiceBase<SkillCategoryItem> implements SkillService {

	public toggleActiveSkill(contract: SkillChangeActiveContract): Observable<SkillItem> {
		let found;
		for (const iterator of this.store) {
			if (iterator.Items) {
				found = iterator.Items.find(x => x.Id === contract.ToUpdate.Id);
				if (found) {
					break;
				}
			}
		}
		if (!found) {
			throw Error('Failed to find obj to update');
		}
		found.IsActive = contract.IsActive;
		return of(found);
	}

	public updateCategory(contract: SkillCategoryUpdateContract): Observable<SkillCategoryItem> {
		const found = this.store.find(x => x.Id === contract.ToUpdate.Id);
		Object.assign(found, contract);
		return of(found);
	}

	public createCategory(contract: SkillCategoryCreateContract): Observable<SkillCategoryItem> {
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

	public createSkill(contract: SkillCreateContract): Observable<SkillItem> {
		const stubForNew = { Id: this.getNextId(), IsActive: true, NodeType: 'skill' }

		let found;
		for (const iterator of this.store) {
			if (iterator.Items) {
				found = iterator.Items.find(x => !HasId(x));
				if (found) {
					break;
				}
			}
		}
		if (!found) {
			throw Error('Failed to find obj to save');
		}

		Object.assign(found, stubForNew);
		return of(found);
	}

	public updateSkill(contract: SkillUpdateContract): Observable<SkillItem> {
		let found;
		for (const iterator of this.store) {
			if (iterator.Items) {
				found = iterator.Items.find(x => x.Id === contract.ToUpdate.Id);
				if (found) {
					break;
				}
			}
		}
		if (!found) {
			throw Error('Failed to find obj to update');
		}

		Object.assign(found, contract);
		return of(found);
	}

	public toggleActiveCategory(contract: SkillCategoryChangeActiveContract): Observable<SkillCategoryItem> {
		const found = this.store.find(x => x.Id === contract.ToUpdate.Id);
		found.IsActive = contract.IsActive;
		return of(found);
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
				Name: 'test cat',
				ShortDescription: 'test description',
				IsActive: true,
				NodeType: 'skill-category',
				IsSelected: false,
				Items: [{
					Id: this.getNextId(),
					Name: 'test skill1',
					ShortDescription: 'test description2',
					IsActive: true,
					NodeType: 'skill',
					IsSelected: false,
					Items: []
				},
				{
					Id: this.getNextId(),
					Name: 'test skill2',
					ShortDescription: 'test description2',
					IsActive: true,
					NodeType: 'skill',
					IsSelected: false,
					Items: []
				}]
			},
			{
				Id: this.getNextId(),
				Name: 'test cat2',
				ShortDescription: 'test description2',
				IsActive: true,
				NodeType: 'skill-category',
				IsSelected: false,
				Items: []
			},
			{
				Id: this.getNextId(),
				Name: 'test cat3',
				ShortDescription: 'test description3',
				IsActive: true,
				NodeType: 'skill-category',
				IsSelected: false,
				Items: []
			}
		];
	}

}
