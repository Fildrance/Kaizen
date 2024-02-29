import { Inject, Injectable } from '@angular/core';
import DataSource from 'devextreme/data/data_source';
import { Observable } from 'rxjs';

import { HasId } from '../../../shared/services/utils.service';
import {
	SkillAggregationLevel,
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
import { TreeNodeViewModel } from 'src/app/shared/models/util.models';

@Injectable()
export class SkillManagerService {

	private addDelegatesByNodeType:
		Map<SkillAggregationLevel | null, (selected: TreeNodeViewModel<any, SkillAggregationLevel>, dataSource: DataSource) => Promise<TreeNodeViewModel<any, SkillAggregationLevel>>> = new Map();
	private saveDelegatesByNodeType:
		Map<SkillAggregationLevel, (selected: TreeNodeViewModel<any, SkillAggregationLevel>, dataSource: DataSource) => void> = new Map();
	private toggleDelegatesByNodeType:
		Map<SkillAggregationLevel, (selected: TreeNodeViewModel<any, SkillAggregationLevel>, dataSource: DataSource) => Observable<{ IsActive?: boolean }>> = new Map();

	constructor(
		@Inject(SkillServiceToken) private skillService: SkillService,
	) {
		this.addDelegatesByNodeType.set(null, (s: TreeNodeViewModel<any, SkillAggregationLevel>, dS: DataSource) => this.addCategory(s, dS));
		this.addDelegatesByNodeType.set(SkillAggregationLevel.SkillCategory, (s: TreeNodeViewModel<any, SkillAggregationLevel>, dS: DataSource) => this.addSkill(s, dS));
		this.addDelegatesByNodeType.set(SkillAggregationLevel.Skill, (s: TreeNodeViewModel<any, SkillAggregationLevel>, dS: DataSource) => this.addSkillLevel(s, dS));

		this.saveDelegatesByNodeType.set(SkillAggregationLevel.SkillCategory, (s: TreeNodeViewModel<any, SkillAggregationLevel>, dS: DataSource) => this.saveCategory(s, dS));
		this.saveDelegatesByNodeType.set(SkillAggregationLevel.Skill, (s: TreeNodeViewModel<any, SkillAggregationLevel>, dS: DataSource) => this.saveSkill(s, dS));
		this.saveDelegatesByNodeType.set(SkillAggregationLevel.SkillLevel, (s: TreeNodeViewModel<any, SkillAggregationLevel>, dS: DataSource) => this.saveSkillLevel(s, dS));

		this.toggleDelegatesByNodeType.set(SkillAggregationLevel.SkillCategory, (s: TreeNodeViewModel<any, SkillAggregationLevel>, dS: DataSource) => this.toggleCategory(s, dS));
		this.toggleDelegatesByNodeType.set(SkillAggregationLevel.Skill, (s: TreeNodeViewModel<any, SkillAggregationLevel>, dS: DataSource) => this.toggleSkill(s, dS));
		this.toggleDelegatesByNodeType.set(SkillAggregationLevel.SkillLevel, (s: TreeNodeViewModel<any, SkillAggregationLevel>, dS: DataSource) => this.toggleSkillLevel(s, dS));
	}

	public addNode(selected: any, store: DataSource): Promise<TreeNodeViewModel<any, SkillAggregationLevel>> {
		const delegate = this.addDelegatesByNodeType.get(selected ? selected.NodeType : null);
		return delegate(selected, store);
	}

	public saveNode(selected: any, store: DataSource): void {
		if (!selected || !selected.NodeType) {
			throw Error('Cannot save node without selected node!');
		}
		const delegate = this.saveDelegatesByNodeType.get(selected.NodeType);
		delegate(selected, store);
	}

	public toggleNode(selected: any, store: DataSource): void {
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

	private addCategory(_: any, dataSource: DataSource): Promise<TreeNodeViewModel<any, SkillAggregationLevel>> {
		const alreadyExistingUnsaved = dataSource.items()
			.find(i => !HasId(i));
		if (alreadyExistingUnsaved) {
			return Promise.resolve(alreadyExistingUnsaved);
		}
		const newRecord = {
			NodeType: SkillAggregationLevel.SkillCategory
		};
		dataSource.store().insert(newRecord);
		return dataSource.reload()
			.then(() => dataSource.items().find(i => !HasId(i)));
	}

	private addSkill(selected: TreeNodeViewModel<any, SkillAggregationLevel>, dataSource: DataSource): Promise<TreeNodeViewModel<any, SkillAggregationLevel>> {
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
			NodeType: SkillAggregationLevel.Skill,
			Items: [],
			IsActive: true,
			Parent: selected
		};
		selected.Items.push(newRecord);
		return dataSource.reload()
			.then(_ => newRecord);
	}


	private addSkillLevel(selected: any, dataSource: DataSource): Promise<TreeNodeViewModel<any, SkillAggregationLevel>> {
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
			NodeType: SkillAggregationLevel.SkillLevel,
			Items: [],
			IsActive: true,
			Parent: selected
		};
		selected.Items.push(newRecord);
		return dataSource.reload()
			.then(_ => newRecord);
	}

	private saveCategory(selected: any, dataSource: DataSource): void {
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

	private saveSkill(selected: any, dataSource: DataSource): void {
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

	private saveSkillLevel(selected: any, dataSource: DataSource): void {
		let observable: Observable<SkillLevelItem>;
		const selectedLevel: SkillLevelItem = selected;
		if (HasId(selected)) {
			const contract: SkillLevelUpdateContract = {
				ToUpdate: { Id: selected.Id },
				Name: selected.Name,
				ShortDescription: selected.ShortDescription,
				Description: selectedLevel.Description,
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
				Description: selectedLevel.Description,
				Weight: selectedLevel.Weight
			};
			observable = this.skillService.createSkillLevel(contract);
		}
		observable.subscribe(x => {
			Object.assign(selected, x);
			dataSource.reload();
		});
	}

	private toggleCategory(selected: TreeNodeViewModel<any, SkillAggregationLevel>, dataSource: DataSource): Observable<{ IsActive?: boolean }> {
		const contract: SkillCategoryChangeActiveContract = {
			ToUpdate: { Id: selected.Id },
			IsActive: !selected.IsActive
		};
		return this.skillService.toggleActiveCategory(contract);
	}

	private toggleSkill(selected: TreeNodeViewModel<any, SkillAggregationLevel>, dataSource: DataSource): Observable<{ IsActive?: boolean }> {
		const contract: SkillChangeActiveContract = {
			ToUpdate: { Id: selected.Id },
			IsActive: !selected.IsActive
		};
		return this.skillService.toggleActiveSkill(contract);
	}

	private toggleSkillLevel(selected: TreeNodeViewModel<any, SkillAggregationLevel>, dataSource: DataSource): Observable<{ IsActive?: boolean }> {
		const contract: SkillLevelChangeActiveContract = {
			ToUpdate: { Id: selected.Id },
			IsActive: !selected.IsActive
		};
		return this.skillService.toggleActiveSkillLevel(contract);
	}
}
