import { Component, Inject, OnDestroy } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Subscription, of } from 'rxjs';
import { filter, map, switchMap } from 'rxjs/operators';

import { SkillAggregationLevel, SkillBriefItem, SkillItem, SkillLevelItem, SkillLevelPrerequisiteItem } from 'src/app/shared/models/skill.model';
import { SkillManagerState } from '../../models/skill-manager-state';
import { SkillService, SkillServiceToken } from '../../services/skill.service';
import { TreeNodeViewModel } from 'src/app/shared/models/util.models';


@Component({
	templateUrl: 'skill-level.component.html',
	styleUrls: ['./skill-level.component.scss']
})
export class SkillLevelComponent implements OnDestroy {

	public data: SkillLevelViewModel;

	public selectedNode: TreeNodeViewModel<any, SkillAggregationLevel>;

	private subscription: Subscription;

	skillsLevelsDataSource: SkillBriefItem; // todo: fill and bind, calculated prerequisite chain, mark already obtained ones by current user

	constructor(
		private state: SkillManagerState,
		activeRoute: ActivatedRoute,
		@Inject(SkillServiceToken) private client: SkillService,

	) {
		this.subscription = activeRoute.url.pipe(
			switchMap(_ => this.state.SelectedNode$),
			filter(x => x && x.NodeType === SkillAggregationLevel.SkillLevel),
			switchMap(
				x => {
					if (x.Id) {
						return client.findSkillLevel(x.Id)
							.pipe(map(res => { return ({ data: res, nodeFromTree: x }); }));
					} else {
						return of({
							data: {
								IsActive: true,
								NodeType: SkillAggregationLevel.SkillLevel.toFixed(),
								Prerequisites: []
							} as SkillLevelItem,
							nodeFromTree: x
						});
					}
				}
			)
		).subscribe(x => {
			this.data = new SkillLevelViewModel(x.data, x.nodeFromTree);
		});
	}

	public ngOnDestroy(): void {
		this.subscription.unsubscribe();
	}

	public removePrerequisite(item: SkillLevelPrerequisiteItem): void {
		//this.client.removePrerequisite(); todo
	}

	public get canEdit(): boolean {
		return true;
	}
}

export class SkillLevelViewModel {
	constructor(
		private item: SkillLevelItem,
		private fromTree: TreeNodeViewModel<any, SkillAggregationLevel>
	) {
		if (fromTree.Name !== item.Name) {
			fromTree.Name = item.Name;
		}
	}

	get NameWithPath(): string {
		return `${this.fromTree.Parent.Parent.Name} => ${this.fromTree.Parent.Name} => ${this.fromTree.Name}`
	}

	get Name(): string {
		return this.item.Name;
	}

	set Name(value: string) {
		this.fromTree.Name = value;
		this.item.Name = value;
	}

	get IsActive(): boolean {
		return this.item.IsActive;
	}

	get ShortDescription(): string | null {
		return this.item.ShortDescription;
	}

	set ShortDescription(value: string) {
		this.item.ShortDescription = value;
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

	get Id(): number {
		return this.item.Id;
	}
}
