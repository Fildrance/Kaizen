import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Observable, map, switchMap, take, tap } from 'rxjs';

import { SkillAggregationLevel, SkillChangeActiveContract, SkillCreateContract, SkillItem, SkillUpdateContract } from '../../../shared/models/skill.model';
import { SkillManagerState } from '../../models/skill-manager-state';
import { SkillService } from '../../services/skill.service';
import { TreeNodeViewModel } from 'src/app/shared/models/util.models';
import { SkillEditorViewModel, SkillItemRelatedComponentBase } from '../skill-manager/skill-item-related-component-base';
import DataSource from 'devextreme/data/data_source';
import { HasId } from 'src/app/shared/services/utils.service';

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
		client: SkillService,
	) {
		super(state, activeRoute, client);
	}

	protected find(id: number): Observable<SkillItem> {
		return this.skillService.findSkill(id)
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
			const contract: SkillUpdateContract = {
				ToUpdate: { Id: this.data.Id },
				Name: this.data.Name,
				ShortDescription: this.data.ShortDescription
			};
			obs = this.skillService.updateSkill(contract);
		} else {
			const contract: SkillCreateContract = {
				Name: this.data.Name,
				ShortDescription: this.data.ShortDescription,
				Parent: { Id: this.data.ParentId }
			};
			obs = this.skillService.createSkill(contract);
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
		const contract: SkillChangeActiveContract = {
			ToUpdate: { Id: selected.Id },
			IsActive: !selected.IsActive
		};
		return this.skillService.toggleActiveSkill(contract);
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
