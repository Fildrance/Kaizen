import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Observable, combineLatest, map, switchMap, take, tap } from 'rxjs';
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
import { SkillLevelPrerequisiteService } from '../../services/skill-level-prerequisite.service';
import { SkillLevelPrerequisiteAttachRequest, SkillLevelPrerequisiteDetachRequest } from '../../../shared/generated/model/models';
import { SkillTreeListItem } from '../../models/skill-tree-list-item';
import { PrerequisiteChainBuilder, PrerequisiteChain } from '../../models/prerequisite-chain';

@Component({
	templateUrl: 'skill-level.component.html',
	styleUrls: ['./skill-level.component.scss']
})
export class SkillLevelComponent extends SkillItemRelatedComponentBase<SkillLevelViewModel, SkillLevelItem> {

	public data: SkillLevelViewModel;
	public prerequisiteSwithcLabel: PrerquisiteDisplayModeType = 'Only direct prerequisites';
	public nonSelectedSkillLevels: SkillTreeListItem[];
	public selectedNode: TreeNodeViewModel<any, SkillAggregationLevel>;

	private skillsLevels: SkillTreeListItem[]; // todo: fill and bind, calculated prerequisite chain, mark already obtained ones by current user
	private _displayFullPrerequisiteList: boolean = false;

	protected get Level(): SkillAggregationLevel {
		return SkillAggregationLevel.SkillLevel;
	}

	public get displayFullPrerequisiteList(): boolean {
		return this._displayFullPrerequisiteList;
	}

	public set displayFullPrerequisiteList(value: boolean) {
		this._displayFullPrerequisiteList = value;
		this.data.setDisplayPrerequisiteMode(value);
		this.updatePrerequisiteSwithcLabel(value);
	}

	constructor(
		state: SkillManagerState,
		activeRoute: ActivatedRoute,
		private skillService: SkillLevelsService,
		private prerequisiteService: SkillLevelPrerequisiteService
	) {
		super(state, activeRoute);
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
				this.data.addPrerequisite(x, this.skillsLevels)

				this.updateNonSelectedSkillLevelList(this.data);

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
				this.data.removePrerequisite(item);

				this.updateNonSelectedSkillLevelList(this.data);
			})
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
	protected createViewModel(obs: Observable<{ data: SkillLevelItem, nodeFromTree: TreeNodeViewModel<any, SkillAggregationLevel> }>): Observable<SkillLevelViewModel> {
		return obs.pipe(
			switchMap(currentInfo => combineLatest([
				this.prerequisiteService.querySkillLevels().pipe(take(1)),
				this.prerequisiteService.queryPrerequisites().pipe(take(1))
			]).pipe(
				map(
					([skillLevels, prerequisitesFullList]) => ({
						skillLevels: skillLevels,
						prerequisitesFullList: prerequisitesFullList,
						currentInfo: currentInfo
					})
				)
			)
			),
			map(x => {

				this.skillsLevels = x.skillLevels;

				let chainBuilder = new PrerequisiteChainBuilder(x.skillLevels, x.prerequisitesFullList);
				let newViewModel = new SkillLevelViewModel(x.currentInfo.data, x.currentInfo.nodeFromTree, chainBuilder)
				this.updateNonSelectedSkillLevelList(newViewModel);

				return newViewModel;
			})
		)
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
		let selectedWithTreeData = obs.pipe(
			switchMap(
				x => this.state.SelectedNode$
					.pipe(
						take(1),
						map(nodeFromTree => { return { data: x, nodeFromTree }; })
					)
			)
		);
		return this.createViewModel(selectedWithTreeData)
			.pipe(tap(x => this.data = x));
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

	private updatePrerequisiteSwithcLabel(value: boolean) {
		if (value) {
			this.prerequisiteSwithcLabel = 'Full prerequisite chain';
		} else {
			this.prerequisiteSwithcLabel = 'Only direct prerequisites';
		}
	}

	private updateNonSelectedSkillLevelList(data: SkillLevelViewModel): void {
		let prerequisites = data.getPrerequisites(true);
		if (prerequisites && prerequisites.length) {
			this.nonSelectedSkillLevels = this.skillsLevels.filter(x => !prerequisites.some(p => p.RequiredSkillId == x.Id) && data.Id !== x.Id);
		} else {
			this.nonSelectedSkillLevels = this.skillsLevels.filter(x => x.Id !== data.Id);
		}
	}

}

export class SkillLevelViewModel extends SkillEditorViewModel<SkillLevelItem>{

	private prerequisiteChain: PrerequisiteChain;
	private _displayFullPrerequisiteTree: boolean;

	constructor(
		item: SkillLevelItem,
		fromTree: TreeNodeViewModel<any, SkillAggregationLevel>,
		chainBuilder: PrerequisiteChainBuilder
	) {
		super(item, fromTree);

		this.prerequisiteChain = chainBuilder.withListOwner(item);
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

	public setDisplayPrerequisiteMode(value: boolean): void {
		this._displayFullPrerequisiteTree = value;
	}

	public getPrerequisites(displayFullPrerequisiteList: boolean): SkillLevelPrerequisiteViewModel[] {
		if (displayFullPrerequisiteList) {
			return this.prerequisiteChain.getFull();
		} else {
			return this.prerequisiteChain.getDirect();
		}
	}

	public addPrerequisite(x: SkillLevelPrerequisiteItem, skillsLevels: SkillTreeListItem[]) {
		this.prerequisiteChain?.add(new SkillLevelPrerequisiteViewModel(x, skillsLevels))
	}

	public removePrerequisite(item: SkillLevelPrerequisiteViewModel) {
		this.prerequisiteChain?.remove(item);
	}
}

export class SkillLevelPrerequisiteViewModel {
	private requiredSkillLevel: SkillTreeListItem;

	constructor(
		private item: SkillLevelPrerequisiteItem,
		skillLevels: SkillTreeListItem[]
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

type PrerquisiteDisplayModeType = 'Only direct prerequisites' | 'Full prerequisite chain';
