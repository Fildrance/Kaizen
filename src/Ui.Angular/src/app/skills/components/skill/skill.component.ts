import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Observable, map, switchMap, take, tap } from 'rxjs';

import { SkillManagerState } from '../../models/skill-manager-state';
import { TreeNodeViewModel } from 'src/app/shared/models/util.models';
import { SkillEditorViewModel, SkillItemRelatedComponentBase } from '../skill-manager/skill-item-related-component-base';
import { SkillAggregationLevel } from '../../../shared/generated/model/skill-aggregation-level';
import { SkillChangeActiveRequest } from '../../../shared/generated/model/skill-change-active-request';
import { SkillCreateRequest } from '../../../shared/generated/model/skill-create-request';
import { SkillItem } from '../../../shared/generated/model/skill-item';
import { SkillUpdateRequest } from '../../../shared/generated/model/skill-update-request';
import { SkillsService } from '../../../shared/generated/api/api';

@Component({
	templateUrl: 'skill.component.html',
	styleUrls: ['./skill.component.scss']
})
export class SkillComponent extends SkillItemRelatedComponentBase<SkillViewModel, SkillItem> {

	protected get Level(): SkillAggregationLevel {
		return SkillAggregationLevel.Skill;
	}

	public data: SkillViewModel;

	constructor(
		state: SkillManagerState,
		activeRoute: ActivatedRoute,
		private skillService: SkillsService,
	) {
		super(state, activeRoute);
	}

	protected find(id: number): Observable<SkillItem> {
		return this.skillService.find(id)
	}

	protected createBlank(): SkillItem {
		return {
			IsActive: true,
			NodeType: SkillAggregationLevel.Skill.toString(),
			Items: [],
		} as SkillItem;
	}

	protected createViewModel(data: SkillItem, nodeFromTree: TreeNodeViewModel<any, SkillAggregationLevel>): SkillViewModel {
		return new SkillViewModel(data, nodeFromTree)
	}

	protected save(): Observable<any> {
		let obs: Observable<SkillItem>;
		if (this.data.Id) {
			const contract: SkillUpdateRequest = {
				ToUpdate: { Id: this.data.Id },
				Name: this.data.Name,
				ShortDescription: this.data.ShortDescription
			};
			obs = this.skillService.update(contract);
		} else {
			const contract: SkillCreateRequest = {
				Name: this.data.Name,
				ShortDescription: this.data.ShortDescription,
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
		return this.toggleSkill(this.data)
	}

	private toggleSkill(selected: SkillViewModel): Observable<{ IsActive?: boolean }> {
		const contract: SkillChangeActiveRequest = {
			ToUpdate: { Id: selected.Id },
			IsActive: !selected.IsActive
		};
		return this.skillService.changeActive(contract);
	}
}

export class SkillViewModel extends SkillEditorViewModel<SkillItem> {
	constructor(
		item: SkillItem,
		fromTree: TreeNodeViewModel<any, SkillAggregationLevel>
	) {
		super(item, fromTree);
	}
}
