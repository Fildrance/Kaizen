import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Observable, map, switchMap, take, tap } from 'rxjs';

import { SkillAggregationLevel, SkillBriefItem, SkillLevelChangeActiveContract, SkillLevelCreateContract, SkillLevelItem, SkillLevelPrerequisiteItem, SkillLevelUpdateContract } from 'src/app/shared/models/skill.model';
import { SkillManagerState } from '../../models/skill-manager-state';
import { SkillService } from '../../services/skill.service';
import { TreeNodeViewModel } from 'src/app/shared/models/util.models';
import { SkillEditorViewModel, SkillItemRelatedComponentBase } from '../skill-manager/skill-item-related-component-base';
import { HasId } from 'src/app/shared/services/utils.service';
import DataSource from 'devextreme/data/data_source';
import { SkillCategoryViewModel } from '../skill-category/skill-category.component';

@Component({
	templateUrl: 'skill-level.component.html',
	styleUrls: ['./skill-level.component.scss']
})
export class SkillLevelComponent extends SkillItemRelatedComponentBase<SkillLevelViewModel, SkillLevelItem> {

	public data: SkillLevelViewModel;

	public selectedNode: TreeNodeViewModel<any, SkillAggregationLevel>;

	skillsLevelsDataSource: SkillBriefItem; // todo: fill and bind, calculated prerequisite chain, mark already obtained ones by current user

	protected get Level(): SkillAggregationLevel {
		return SkillAggregationLevel.SkillLevel;
	}

	constructor(
		state: SkillManagerState,
		activeRoute: ActivatedRoute,
		skillService: SkillService,
	) {
		super(state, activeRoute, skillService);
	}

	protected find(id: number): Observable<SkillLevelItem> {
		return this.skillService.findSkillLevel(id)
	}

	protected createBlank(): SkillLevelItem {
		return {
			IsActive: true,
			NodeType: SkillAggregationLevel.SkillLevel.toString(),
			Prerequisites: []
		} as SkillLevelItem;
	}

	protected createViewModel(data: SkillLevelItem, nodeFromTree: TreeNodeViewModel<any, SkillAggregationLevel>): SkillLevelViewModel {
		return new SkillLevelViewModel(data, nodeFromTree);
	}

	public removePrerequisite(item: SkillLevelPrerequisiteItem): void {
		//this.client.removePrerequisite(); todo
	}

	protected save(): Observable<any> {
		let obs: Observable<SkillLevelItem>;
		if (this.data.Id) {
			const contract: SkillLevelUpdateContract = {
				ToUpdate: { Id: this.data.Id },
				Name: this.data.Name,
				ShortDescription: this.data.ShortDescription,
				Description: this.data.Description,
				Weight: this.data.Weight
			};
			obs = this.skillService.updateSkillLevel(contract);
		} else {
			const contract: SkillLevelCreateContract = {
				Name: this.data.Name,
				ShortDescription: this.data.ShortDescription,
				Description: this.data.Description,
				Weight: this.data.Weight,
				Parent: { Id: this.data.ParentId }
			};
			obs = this.skillService.createSkillLevel(contract);
		}
		return obs.pipe(
			switchMap(
				x => this.state.SelectedNode$
					.pipe(
						take(1),
						map(nodeFromTree => { return { data: x, nodeFromTree }; })
					)
			),
			tap(x => this.data = this.createViewModel(x.data, x.nodeFromTree))
		);
	}

	protected toggleActive(): Observable<any> {
		return this.toggleSkillLevel(this.data);
	}

	private toggleSkillLevel(selected: SkillLevelViewModel): Observable<{ IsActive?: boolean }> {
		const contract: SkillLevelChangeActiveContract = {
			ToUpdate: { Id: selected.Id },
			IsActive: !selected.IsActive
		};
		return this.skillService.toggleActiveSkillLevel(contract);
	}
}

export class SkillLevelViewModel extends SkillEditorViewModel<SkillLevelItem>{
	constructor(
		item: SkillLevelItem,
		fromTree: TreeNodeViewModel<any, SkillAggregationLevel>
	) {
		super(item, fromTree);
	}

	get NameWithPath(): string {
		return `${this.fromTree.Parent.Parent.Name} => ${this.fromTree.Parent.Name} => ${this.fromTree.Name}`
	}

	get Description(): string | null {
		return this.item.Description;
	}

	set Description(value: string) {
		this.item.Description = value;
	}

	get Weight(): number | null {
		return this.item.Weight;
	}

	set Weight(value: number | null) {
		this.item.Weight = value;
	}

}
