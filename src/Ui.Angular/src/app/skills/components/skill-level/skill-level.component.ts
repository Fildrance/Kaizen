import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Observable, map, switchMap, take, tap } from 'rxjs';

import { SkillManagerState } from '../../models/skill-manager-state';
import { TreeNodeViewModel } from 'src/app/shared/models/util.models';
import { SkillEditorViewModel, SkillItemRelatedComponentBase } from '../skill-manager/skill-item-related-component-base';
import { SkillAggregationLevel } from '../../../shared/generated/model/skill-aggregation-level';
import { SkillLevelChangeActiveRequest } from '../../../shared/generated/model/skill-level-change-active-request';
import { SkillLevelCreateRequest } from '../../../shared/generated/model/skill-level-create-request';
import { SkillLevelItem } from '../../../shared/generated/model/skill-level-item';
import { SkillLevelPrerequisiteItem } from '../../../shared/generated/model/skill-level-prerequisite-item';
import { SkillLevelUpdateRequest } from '../../../shared/generated/model/skill-level-update-request';
import { SkillLevelsService } from '../../../shared/generated/api/skill-levels';

@Component({
	templateUrl: 'skill-level.component.html',
	styleUrls: ['./skill-level.component.scss']
})
export class SkillLevelComponent extends SkillItemRelatedComponentBase<SkillLevelViewModel, SkillLevelItem> {

	public data: SkillLevelViewModel;

	public selectedNode: TreeNodeViewModel<any, SkillAggregationLevel>;

	skillsLevelsDataSource: any; // todo: fill and bind, calculated prerequisite chain, mark already obtained ones by current user

	protected get Level(): SkillAggregationLevel {
		return SkillAggregationLevel.SkillLevel;
	}

	constructor(
		state: SkillManagerState,
		activeRoute: ActivatedRoute,
		private skillService: SkillLevelsService,
	) {
		super(state, activeRoute);
	}

	protected find(id: number): Observable<SkillLevelItem> {
		return this.skillService.find(id)
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
			const contract: SkillLevelUpdateRequest = {
				ToUpdate: { Id: this.data.Id },
				Name: this.data.Name,
				ShortDescription: this.data.ShortDescription,
				Description: this.data.Description,
				Weight: this.data.Weight
			};
			obs = this.skillService.update(contract);
		} else {
			const contract: SkillLevelCreateRequest = {
				Name: this.data.Name,
				ShortDescription: this.data.ShortDescription,
				Description: this.data.Description,
				Weight: this.data.Weight,
				Parent: { Id: this.data.ParentId }
			};
			obs = this.skillService.create(contract);
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
		const contract: SkillLevelChangeActiveRequest = {
			ToUpdate: { Id: selected.Id },
			IsActive: !selected.IsActive
		};
		return this.skillService.changeActive(contract);
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
