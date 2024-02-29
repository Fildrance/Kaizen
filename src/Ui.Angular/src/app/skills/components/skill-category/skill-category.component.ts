import { Component, Inject, OnDestroy } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Subscription, of } from 'rxjs';
import { filter, map, switchMap } from 'rxjs/operators';

import { SkillAggregationLevel, SkillCategoryItem } from 'src/app/shared/models/skill.model';
import { SkillManagerState } from '../../models/skill-manager-state';
import { SkillService, SkillServiceToken } from '../../services/skill.service';
import { TreeNodeViewModel } from 'src/app/shared/models/util.models';


@Component({
	templateUrl: 'skill-category.component.html',
	styleUrls: ['./skill-category.component.scss']
})
export class SkillCategoryComponent implements OnDestroy {

	public data: SkillCategoryViewModel;

	private subscription: Subscription;

	constructor(
		private state: SkillManagerState,
		activeRoute: ActivatedRoute,
		@Inject(SkillServiceToken) private client: SkillService,
	) {
		this.subscription = activeRoute.url.pipe(
			switchMap(_ => this.state.SelectedNode$),
			filter(x => x && x.NodeType === SkillAggregationLevel.SkillCategory),
			switchMap(
				x => {
					if (x.Id) {
						return client.findSkillCategory(x.Id)
							.pipe(map(res => { return ({ data: res, nodeFromTree: x }); }));
					} else {
						return of({
							data: {
								IsActive: true,
								NodeType: SkillAggregationLevel.SkillCategory.toFixed(),
								Items: []
							} as SkillCategoryItem,
							nodeFromTree: x
						})
					}
				}
			)
		).subscribe(x => {
			this.data = new SkillCategoryViewModel(x.data, x.nodeFromTree);
		});
	}

	public ngOnDestroy(): void {
		this.subscription.unsubscribe();
	}

	public get canEdit(): boolean {
		return true;
	}
}

export class SkillCategoryViewModel {
	constructor(
		private item: SkillCategoryItem,
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
