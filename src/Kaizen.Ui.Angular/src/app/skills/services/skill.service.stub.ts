import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { TreeNode } from 'src/app/shared/models/util.models';

import { Page } from '../../shared/models/shared.models';
import {
	SkillCategoryItem,
	SkillChangeActiveContract,
	SkillItem,
	SkillCategoryUpdateContract,
	SkillCategoryCreateContract,
	SkillCreateContract,
	SkillUpdateContract,
	SkillCategoryChangeActiveContract,
	SkillLevelCreateContract,
	SkillLevelItem,
	SkillLevelUpdateContract,
	SkillLevelChangeActiveContract
} from '../../shared/models/skill.model';
import { StubCrudServiceBase } from '../../shared/services/stub-service-base';
import { HasId, searchInTree } from '../../shared/services/utils.service';
import { SkillService } from './skill.service';

@Injectable()
export class SkillServiceStub extends StubCrudServiceBase<SkillCategoryItem & TreeNode<any>> implements SkillService {

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
		const stubForNew = { Id: this.getNextId(), IsActive: true, NodeType: 'skill' };

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
		const found = searchInTree(this.store, contract.ToUpdate.Id, 'skill');
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

	public createSkillLevel(contract: SkillLevelCreateContract): Observable<SkillLevelItem> {
		const stubForNew = { Id: this.getNextId(), IsActive: true, NodeType: 'skill-level' };

		let found;
		for (const skillCat of this.store) {
			for (const skill of skillCat.Items) {
				if (skill.Items) {
					found = skill.Items.find(x => !HasId(x));
					if (found) {
						break;
					}
				}
			}
		}
		if (!found) {
			throw Error('Failed to find obj to save');
		}

		Object.assign(found, stubForNew);
		return of(found);
	}

	public updateSkillLevel(contract: SkillLevelUpdateContract): Observable<SkillLevelItem> {
		const found = searchInTree(this.store, contract.ToUpdate.Id, 'skill-level');
		if (!found) {
			throw Error('Failed to find obj to update');
		}

		Object.assign(found, contract);
		return of(found);
	}

	public toggleActiveSkillLevel(contract: SkillLevelChangeActiveContract): Observable<SkillLevelItem> {
		const found = searchInTree(this.store, contract.ToUpdate.Id, 'skill-level');
		found.IsActive = contract.IsActive;
		return of(found);
	}

	protected fillStore(): Array<SkillCategoryItem & TreeNode<any>> {
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
					Items: [{
						Id: this.getNextId(),
						Name: 'test skill leve1',
						ShortDescription: 'test description2',
						IsActive: true,
						NodeType: 'skill',
						IsSelected: false,
						FullDescription: 'this is full description',
						Weight: 8
					}, {
						Id: this.getNextId(),
						Name: 'test skill level1',
						ShortDescription: 'test description2',
						IsActive: true,
						NodeType: 'skill',
						IsSelected: false,
						Weight: 0,
						FullDescription: 'qreghqerhoiqe roigher'
					}]
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
