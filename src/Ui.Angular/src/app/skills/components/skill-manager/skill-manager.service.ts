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
	SkillLevelChangeActiveContract,
	SkillLevelCreateContract,
	SkillLevelItem,
	SkillLevelUpdateContract,
	SkillUpdateContract
} from '../../../shared/models/skill.model';
import { SkillService, SkillServiceToken } from '../../services/skill.service';
import { TreeNode } from 'src/app/shared/models/util.models';

@Injectable()
export class SkillManagerService {

	private addDelegatesByNodeType:
		Map<string, (selected: TreeNode<any> & SkillBase, dataSource: DataSource) => Promise<TreeNode<any> & SkillBase>> = new Map();
	private saveDelegatesByNodeType:
		Map<string, (selected: TreeNode<any> & SkillBase, dataSource: DataSource) => void> = new Map();
	private toggleDelegatesByNodeType:
		Map<string, (selected: TreeNode<any> & SkillBase, dataSource: DataSource) => Observable<{ IsActive?: boolean }>> = new Map();

	constructor(
		@Inject(SkillServiceToken) private skillService: SkillService,
	) {
		this.addDelegatesByNodeType.set(null, (s: TreeNode<any> & SkillBase, dS: DataSource) => this.addCategory(s, dS));
		this.addDelegatesByNodeType.set('skill-category', (s: TreeNode<any> & SkillBase, dS: DataSource) => this.addSkill(s, dS));
		this.addDelegatesByNodeType.set('skill', (s: TreeNode<any> & SkillBase, dS: DataSource) => this.addSkillLevel(s, dS));

		this.saveDelegatesByNodeType.set('skill-category', (s: TreeNode<any> & SkillBase, dS: DataSource) => this.saveCategory(s, dS));
		this.saveDelegatesByNodeType.set('skill', (s: TreeNode<any> & SkillBase, dS: DataSource) => this.saveSkill(s, dS));
		this.saveDelegatesByNodeType.set('skill-level', (s: TreeNode<any> & SkillBase, dS: DataSource) => this.saveSkillLevel(s, dS));

		this.toggleDelegatesByNodeType.set('skill-category', (s: TreeNode<any> & SkillBase, dS: DataSource) => this.toggleCategory(s, dS));
		this.toggleDelegatesByNodeType.set('skill', (s: TreeNode<any> & SkillBase, dS: DataSource) => this.toggleSkill(s, dS));
		this.toggleDelegatesByNodeType.set('skill-level', (s: TreeNode<any> & SkillBase, dS: DataSource) => this.toggleSkillLevel(s, dS));
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
		if (!HasId(selected)) {
			selected.IsActive = !selected.IsActive;
			return;
		}
		const delegate = this.toggleDelegatesByNodeType.get(selected.NodeType);
		delegate(selected, store).subscribe(x => {
			selected.IsActive = x.IsActive;
			store.reload();
		});
	}

	private addCategory(_: TreeNode<any> & SkillBase, dataSource: DataSource): Promise<TreeNode<any> & SkillBase> {
		const alreadyExistingUnsaved = dataSource.items()
			.find(i => !HasId(i));
		if (alreadyExistingUnsaved) {
			return Promise.resolve(alreadyExistingUnsaved);
		}
		const newRecord = {
			NodeType: 'skill-category'
		};
		dataSource.store().insert(newRecord);
		return dataSource.reload()
			.then(() => dataSource.items().find(i => !HasId(i)));
	}

	private addSkill(selected: TreeNode<any> & SkillBase, dataSource: DataSource): Promise<TreeNode<any> & SkillBase> {
		if (!HasId(selected)) {
			return Promise.resolve(selected);
		}
		if (selected.Items) {
			const alreadyExistingUnsaved = selected.Items.find(i => !HasId(i));
			if (alreadyExistingUnsaved) {
				return Promise.resolve(alreadyExistingUnsaved);
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
			.then(_ => newRecord);
	}


	private addSkillLevel(selected: TreeNode<any> & SkillBase, dataSource: DataSource): Promise<TreeNode<any> & SkillBase> {
		if (!HasId(selected)) {
			return Promise.resolve(selected);
		}
		if (selected.Items) {
			const alreadyExistingUnsaved = selected.Items.find(i => !HasId(i));
			if (alreadyExistingUnsaved) {
				return Promise.resolve(alreadyExistingUnsaved);
			}
		}
		const newRecord: any = {
			NodeType: 'skill-level',
			Items: [],
			IsActive: true,
			Parent: selected
		};
		selected.Items.push(newRecord);
		return dataSource.reload()
			.then(_ => newRecord);
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
			Object.assign(selected, x);
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

	private saveSkillLevel(selected: TreeNode<any> & SkillBase, dataSource: DataSource): void {
		let observable: Observable<SkillLevelItem>;
		const selectedLevel: SkillLevelItem = selected;
		if (HasId(selected)) {
			const contract: SkillLevelUpdateContract = {
				ToUpdate: { Id: selected.Id },
				Name: selected.Name,
				ShortDescription: selected.ShortDescription,
				FullDescription: selectedLevel.FullDescription,
				Weight: selectedLevel.Weight
			};
			observable = this.skillService.updateSkillLevel(contract);
		} else {
			const parent = (<any>selected).Parent;
			if (!parent || !parent.Id) {
				throw Error('Cannot save skill without reference to skill category, to which it should be attached.');
			}
			const contract: SkillLevelCreateContract = {
				Name: selected.Name,
				ShortDescription: selected.ShortDescription,
				Parent: { Id: parent.Id },
				FullDescription: selectedLevel.FullDescription,
				Weight: selectedLevel.Weight
			};
			observable = this.skillService.createSkillLevel(contract);
		}
		observable.subscribe(x => {
			Object.assign(selected, x);
			dataSource.reload();
		});
	}

	private toggleCategory(selected: TreeNode<any> & SkillBase, dataSource: DataSource): Observable<{ IsActive?: boolean }> {
		const contract: SkillCategoryChangeActiveContract = {
			ToUpdate: { Id: selected.Id },
			IsActive: !selected.IsActive
		};
		return this.skillService.toggleActiveCategory(contract);
	}

	private toggleSkill(selected: TreeNode<any> & SkillBase, dataSource: DataSource): Observable<{ IsActive?: boolean }> {
		const contract: SkillChangeActiveContract = {
			ToUpdate: { Id: selected.Id },
			IsActive: !selected.IsActive
		};
		return this.skillService.toggleActiveSkill(contract);
	}

	private toggleSkillLevel(selected: TreeNode<any> & SkillBase, dataSource: DataSource): Observable<{ IsActive?: boolean }> {
		const contract: SkillLevelChangeActiveContract = {
			ToUpdate: { Id: selected.Id },
			IsActive: !selected.IsActive
		};
		return this.skillService.toggleActiveSkillLevel(contract);
	}
}
