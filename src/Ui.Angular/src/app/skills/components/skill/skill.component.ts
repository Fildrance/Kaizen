import { Component, Inject, OnDestroy } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Subscription, from, of } from 'rxjs';
import { filter, map, switchMap } from 'rxjs/operators';

import { SkillAggregationLevel, SkillItem } from '../../../shared/models/skill.model';
import { SkillManagerState } from '../../models/skill-manager-state';
import { SkillService, SkillServiceToken } from '../../services/skill.service';
import { TreeNodeViewModel } from 'src/app/shared/models/util.models';


@Component({
	templateUrl: 'skill.component.html',
	styleUrls: ['./skill.component.scss']
})
export class SkillComponent implements OnDestroy {

	private subscription: Subscription;

	public data: SkillViewModel;

	constructor(
		private state: SkillManagerState,
		activeRoute: ActivatedRoute,
		@Inject(SkillServiceToken) private client: SkillService,
	) {
		this.subscription = activeRoute.url.pipe(
			switchMap(_ => this.state.SelectedNode$),
			filter(x => x && x.NodeType === SkillAggregationLevel.Skill),
			switchMap(
				x => {
					if (x.Id) {
						return client.findSkill(x.Id)
							.pipe(map(res => { return ({ data: res, nodeFromTree: x }); }));
					} else {
						return of({
							data: {
								IsActive: true,
								NodeType: SkillAggregationLevel.Skill.toFixed(),
								Items: [],
							} as SkillItem,
							nodeFromTree: x
						})
					}
				}
			)
		).subscribe(x => {
			this.data = new SkillViewModel(x.data, x.nodeFromTree);
		});
	}

	public ngOnDestroy(): void {
		this.subscription.unsubscribe();
	}

	public get canEdit(): boolean {
		return true;
	}
}

export class SkillViewModel {
	constructor(
		private item: SkillItem,
		private fromTree: TreeNodeViewModel<any, SkillAggregationLevel>
	) {
		if (fromTree.Name !== item.Name) {
			fromTree.Name = item.Name;
		}
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

	get Id(): number {
		return this.item.Id;
	}

	set ShortDescription(value: string) {
		this.item.ShortDescription = value;
	}
}
