import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Observable, map, pipe, switchMap, take, tap } from 'rxjs';

import { SkillAggregationLevel, SkillCategoryChangeActiveContract, SkillCategoryCreateContract, SkillCategoryItem, SkillCategoryUpdateContract } from 'src/app/shared/models/skill.model';
import { SkillManagerState } from '../../models/skill-manager-state';
import { SkillService } from '../../services/skill.service';
import { TreeNodeViewModel } from 'src/app/shared/models/util.models';
import { SkillEditorViewModel, SkillItemRelatedComponentBase } from '../skill-manager/skill-item-related-component-base';


@Component({
	templateUrl: 'skill-category.component.html',
	styleUrls: ['./skill-category.component.scss']
})
export class SkillCategoryComponent extends SkillItemRelatedComponentBase<SkillCategoryViewModel, SkillCategoryItem> {
	protected get Level(): SkillAggregationLevel {
		return SkillAggregationLevel.SkillCategory;
	}

	public data: SkillCategoryViewModel;

	constructor(
		state: SkillManagerState,
		activeRoute: ActivatedRoute,
		client: SkillService,
	) {
		super(state, activeRoute, client);
	}

	protected find(id: number): Observable<SkillCategoryItem> {
		return this.skillService.findSkillCategory(id);
	}

	protected createBlank(): SkillCategoryItem {
		return {
			IsActive: true,
			NodeType: SkillAggregationLevel.SkillCategory.toString(),
			Items: []
		} as SkillCategoryItem;
	}

	protected createViewModel(data: SkillCategoryItem, nodeFromTree: TreeNodeViewModel<any, SkillAggregationLevel>): SkillCategoryViewModel {
		return new SkillCategoryViewModel(data, nodeFromTree);
	}

	protected save(): Observable<any> {
		let obs: Observable<SkillCategoryItem>;
		if (this.data.Id) {
			const contract: SkillCategoryUpdateContract = {
				ToUpdate: { Id: this.data.Id },
				Name: this.data.Name,
				ShortDescription: this.data.ShortDescription
			};
			obs = this.skillService.updateCategory(contract);
		} else {
			const contract: SkillCategoryCreateContract = {
				Name: this.data.Name,
				ShortDescription: this.data.ShortDescription
			};
			obs = this.skillService.createCategory(contract);
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
		return this.toggleCategory(this.data);
	}

	private toggleCategory(selected: SkillCategoryViewModel): Observable<{ IsActive?: boolean }> {
		const contract: SkillCategoryChangeActiveContract = {
			ToUpdate: { Id: selected.Id },
			IsActive: !selected.IsActive
		};
		return this.skillService.toggleActiveCategory(contract);
	}
}

export class SkillCategoryViewModel extends SkillEditorViewModel<SkillCategoryItem>{
	constructor(
		item: SkillCategoryItem,
		fromTree: TreeNodeViewModel<any, SkillAggregationLevel>
	) {
		super(item, fromTree)
	}
}
