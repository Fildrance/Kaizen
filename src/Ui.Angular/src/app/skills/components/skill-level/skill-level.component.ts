import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Observable, map, switchMap, take, tap } from 'rxjs';
import { DxSelectBoxComponent } from 'devextreme-angular';

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
import { SkillLevelPrerequisiteService } from '../skill-manager/skill-level-prerequisite.service';
import { SkillLevelPrerequisiteAttachRequest, SkillLevelPrerequisiteDetachRequest } from '../../../shared/generated/model/models';

@Component({
	templateUrl: 'skill-level.component.html',
	styleUrls: ['./skill-level.component.scss']
})
export class SkillLevelComponent extends SkillItemRelatedComponentBase<SkillLevelViewModel, SkillLevelItem> {

	public data: SkillLevelViewModel;

	public selectedNode: TreeNodeViewModel<any, SkillAggregationLevel>;

	private skillsLevels: { Id: number, Name: string, TreeName: string, IsActive: boolean }[]; // todo: fill and bind, calculated prerequisite chain, mark already obtained ones by current user
	public nonSelectedSkillLevels: { Id: number, Name: string, TreeName: string, IsActive: boolean }[];

	protected get Level(): SkillAggregationLevel {
		return SkillAggregationLevel.SkillLevel;
	}

	constructor(
		state: SkillManagerState,
		activeRoute: ActivatedRoute,
		private skillService: SkillLevelsService,
		private prerequisiteService: SkillLevelPrerequisiteService
	) {
		super(state, activeRoute);
	}

	public ngOnInit(): void {
		super.ngOnInit();

		this.prerequisiteService.querySkillLevels()
			.subscribe(
				x => {
					this.skillsLevels = x;
					this.nonSelectedSkillLevels = [...this.skillsLevels]
				}
			);
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
		const created = new SkillLevelViewModel(data, nodeFromTree, this.skillsLevels);
		let prerequisites = created.Prerequisites
		this.nonSelectedSkillLevels = this.skillsLevels.filter(x => !prerequisites.some(p => p.RequiredSkillId == x.Id))
		return created;
	}

	public prerequisiteSelected(e: { value?: number, component: DxSelectBoxComponent }): void {
		if (!e.value) {
			return;
		}

		const found = this.nonSelectedSkillLevels.find(x => x.Id == e.value);

		const request: SkillLevelPrerequisiteAttachRequest = {
			ForSkillLevel: { Id: this.data.Id },
			ReuireSkillLevel: { Id: found.Id }
		}
		this.skillService.attach(request)
			.subscribe(x => {
				this.data.Prerequisites.push(new SkillLevelPrerequisiteViewModel(x, this.skillsLevels));

				let index = this.nonSelectedSkillLevels.indexOf(found);
				this.nonSelectedSkillLevels.splice(index, 1);

				//@ts-ignore
				e.component.instance().clear()
			})
	}

	public removePrerequisite(item: SkillLevelPrerequisiteViewModel): void {
		const request: SkillLevelPrerequisiteDetachRequest = {
			ForSkillLevel: { Id: item.ForSkillLevelId },
			ReuireSkillLevel: { Id: item.RequiredSkillId }
		};
		this.skillService.detach(request)
			.subscribe(_ => {
				let index = this.data.Prerequisites.findIndex(x => x === item);
				this.data.Prerequisites.splice(index, 1);

				let skillLevel = this.skillsLevels.find(x => x.Id === item.RequiredSkillId);

				this.nonSelectedSkillLevels.push({
					Id: skillLevel.Id,
					IsActive: skillLevel.IsActive,
					Name: skillLevel.Name,
					TreeName: skillLevel.TreeName,
				} as { Id: number, Name: string, TreeName: string, IsActive: boolean })
			})
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
	private prerequisites: SkillLevelPrerequisiteViewModel[] = [];

	constructor(
		item: SkillLevelItem,
		fromTree: TreeNodeViewModel<any, SkillAggregationLevel>,
		skillLevels: { Name: string, Id: number, IsActive: boolean, TreeName: string }[]
	) {
		super(item, fromTree);

		if (item.Prerequisites && item.Prerequisites.length) {
			for (const prerequisite of item.Prerequisites) {
				const prerequisiteViewModel = new SkillLevelPrerequisiteViewModel(prerequisite, skillLevels);
				this.prerequisites.push(prerequisiteViewModel);
			}
		}
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

	public get Prerequisites(): SkillLevelPrerequisiteViewModel[] {
		return this.prerequisites;
	}
}

export class SkillLevelPrerequisiteViewModel {
	private requiredSkillLevel: { Name: string, Id: number, IsActive: boolean, TreeName: string };

	constructor(
		private item: SkillLevelPrerequisiteItem,
		skillLevels: { Name: string, Id: number, IsActive: boolean, TreeName: string }[]
	) {
		this.requiredSkillLevel = skillLevels.find(x => x.Id == item.RequiredSkillId);
	}

	get Name(): string {
		return this.requiredSkillLevel.Name;
	}


	get TreeName(): string {
		return this.requiredSkillLevel.TreeName;
	}

	get ForSkillLevelId(): number {
		return this.item.ForSkillLevelId;
	}
	get RequiredSkillId(): number {
		return this.item.RequiredSkillId;
	}

}
