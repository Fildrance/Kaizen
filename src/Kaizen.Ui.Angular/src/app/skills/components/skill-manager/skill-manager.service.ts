import { Inject, Injectable } from '@angular/core';
import DataSource from 'devextreme/data/data_source';
import { Observable } from 'rxjs';

import { HasId } from '../../../shared/services/utils.service';
import {
	SkillBase,
	SkillCategoryChangeActiveContract,
	SkillCategoryCreateContract,
	SkillCategoryItem,
	SkillCategoryUpdateContract,
	SkillChangeActiveContract,
	SkillCreateContract,
	SkillItem,
	SkillUpdateContract,
	TreeNode
} from '../../models/skill-models';
import { SkillService, SkillServiceToken } from '../../services/skill.service';

@Injectable()
export class SkillManagerService {

	private addDelegatesByNodeType:
		Map<string, (selected: TreeNode<any> & SkillBase, dataSource: DataSource) => Promise<TreeNode<any> & SkillBase>> = new Map();
	private saveDelegatesByNodeType:
		Map<string, (selected: TreeNode<any> & SkillBase, dataSource: DataSource) => void> = new Map();
	private toggleDelegatesByNodeType:
		Map<string, (selected: TreeNode<any> & SkillBase, dataSource: DataSource) => void> = new Map();

	constructor(
		@Inject(SkillServiceToken) private skillService: SkillService,
	) {
		this.addDelegatesByNodeType.set(null, (s: TreeNode<any> & SkillBase, dS: DataSource) => this.addCategory(s, dS));
		this.addDelegatesByNodeType.set('skill-category', (s: TreeNode<any> & SkillBase, dS: DataSource) => this.addSkill(s, dS));

		this.saveDelegatesByNodeType.set('skill-category', (s: TreeNode<any> & SkillBase, dS: DataSource) => this.saveCategory(s, dS));
		this.saveDelegatesByNodeType.set('skill', (s: TreeNode<any> & SkillBase, dS: DataSource) => this.saveSkill(s, dS));

		this.toggleDelegatesByNodeType.set('skill-category', (s: TreeNode<any> & SkillBase, dS: DataSource) => this.toggleCategory(s, dS));
		this.toggleDelegatesByNodeType.set('skill', (s: TreeNode<any> & SkillBase, dS: DataSource) => this.toggleSkill(s, dS));
	}

	public addNode(selected: TreeNode<any> & SkillBase, store: DataSource): Promise<TreeNode<any> & SkillBase> {
		const delegate = this.addDelegatesByNodeType.get(selected ? selected.NodeType : null);
		return delegate(selected, store);
	}

	public saveNode(selected: TreeNode<any> & SkillBase, store: DataSource): void {
		if (!selected || !selected.NodeType) {
			throw Error('Cannot save node without selected node!');
		}
		const delegate = this.saveDelegatesByNodeType.get(selected.NodeType);
		delegate(selected, store);
	}

	public toggleNode(selected: TreeNode<any> & SkillBase, store: DataSource): void {
		if (!selected || !selected.NodeType) {
			throw Error('Cannot toggle node without selected node!');
		}
		const delegate = this.toggleDelegatesByNodeType.get(selected.NodeType);
		delegate(selected, store);
	}

	public search(items: Array<TreeNode<any> & SkillBase>, idToFind: number, tierToBeSearched: string): TreeNode<any> & SkillBase {
		if (tierToBeSearched === 'skill-category') {
			return items.find(i => i.Id === idToFind);
		} else if (tierToBeSearched === 'skill') {
			return this.findSkillById(items, idToFind);
		}
	}

	private findSkillById(items: Array<TreeNode<any> & SkillBase>, id: number): TreeNode<any> & SkillBase {
		let found;
		for (const iterator of items) {
			if (iterator.Items) {
				found = iterator.Items.find((i: TreeNode<any>) => i.Id === id);
				if (found) {
					break;
				}
			}
		}
		return found;
	}

	private addSkill(selected: TreeNode<any> & SkillBase, dataSource: DataSource): Promise<TreeNode<any> & SkillBase> {
		if (selected.Items) {
			const alreadyExistingUnsaved = selected.Items.find(i => !HasId(i));
			if (alreadyExistingUnsaved) {
				return new Promise((res, _) => res(alreadyExistingUnsaved));
			}
		}
		const newRecord: any = {
			NodeType: 'skill',
			Items: [],
			IsActive: true,
			Parent: selected
		};
		selected.Items.push(newRecord);
		return dataSource.reload()
			.then(x => {
				return newRecord;
			});
	}

	private addCategory(_: TreeNode<any> & SkillBase, dataSource: DataSource): Promise<TreeNode<any> & SkillBase> {
		const alreadyExistingUnsaved = dataSource.items().find(i => !HasId(i));
		if (alreadyExistingUnsaved) {
			return new Promise((res, _) => res(alreadyExistingUnsaved));
		}
		const newRecord = {
			NodeType: 'skill-category'
		};
		dataSource.store().insert(newRecord);
		return dataSource.reload()
			.then(() => {
				const newItem = dataSource.items().find(i => !HasId(i));
				return newItem;
			});
	}

	private saveCategory(selected: TreeNode<any> & SkillBase, dataSource: DataSource): void {
		let observable: Observable<SkillCategoryItem>;
		if (HasId(selected)) {
			const contract: SkillCategoryUpdateContract = {
				ToUpdate: { Id: selected.Id },
				Name: selected.Name,
				ShortDescription: selected.ShortDescription
			};
			observable = this.skillService.updateCategory(contract);
		} else {
			const contract: SkillCategoryCreateContract = {
				Name: selected.Name,
				ShortDescription: selected.ShortDescription
			};
			observable = this.skillService.createCategory(contract);
		}
		observable.subscribe(x => {
			dataSource.reload();
		});
	}

	private saveSkill(selected: TreeNode<any> & SkillBase, dataSource: DataSource): void {
		let observable: Observable<SkillItem>;
		if (HasId(selected)) {
			const contract: SkillUpdateContract = {
				ToUpdate: { Id: selected.Id },
				Name: selected.Name,
				ShortDescription: selected.ShortDescription
			};
			observable = this.skillService.updateSkill(contract);
		} else {
			const parent = (<any>selected).Parent;
			if (!parent || !parent.Id) {
				throw Error('Cannot save skill without reference to skill category, to which it should be attached.');
			}
			const contract: SkillCreateContract = {
				Name: selected.Name,
				ShortDescription: selected.ShortDescription,
				Parent: { Id: parent.Id }
			};
			observable = this.skillService.createSkill(contract);
		}
		observable.subscribe(x => {
			Object.assign(selected, x);
			dataSource.reload();
		});
	}

	private toggleCategory(selected: TreeNode<any> & SkillBase, dataSource: DataSource): void {
		const contract: SkillCategoryChangeActiveContract = {
			ToUpdate: { Id: selected.Id },
			IsActive: !selected.IsActive
		};
		const observable = this.skillService.toggleActiveCategory(contract);
		observable.subscribe(x => dataSource.reload());
	}

	private toggleSkill(selected: TreeNode<any> & SkillBase, dataSource: DataSource): void {
		const contract: SkillChangeActiveContract = {
			ToUpdate: { Id: selected.Id },
			IsActive: !selected.IsActive
		};
		const observable = this.skillService.toggleActiveSkill(contract);
		observable.subscribe(x => dataSource.reload());
	}
}
