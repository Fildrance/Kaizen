import { Component, Inject, OnDestroy } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Subscription } from 'rxjs';
import { filter, switchMap } from 'rxjs/operators';

import { SkillAggregationLevel, SkillCategoryItem } from 'src/app/shared/models/skill.model';
import { SkillManagerState } from '../../models/skill-manager-state';
import { SkillService, SkillServiceToken } from '../../services/skill.service';


@Component({
	templateUrl: 'skill-category.component.html',
	styleUrls: ['./skill-category.component.scss']
})
export class SkillCategoryComponent implements OnDestroy {

	public data: SkillCategoryItem;

	private subscription: Subscription;

	constructor(
		private state: SkillManagerState,
		activeRoute: ActivatedRoute,
		@Inject(SkillServiceToken) private client: SkillService,
	) {
		this.subscription = activeRoute.url.pipe(
			switchMap(_ => this.state.SelectedNode$),
			filter(x => x && x.NodeType === SkillAggregationLevel.SkillCategory),
			switchMap(x => client.findSkillCategory(x.Id))
		).subscribe(x => {
			this.data = x;
		});
	}

	public ngOnDestroy(): void {
		this.subscription.unsubscribe();
	}

	public get canEdit(): boolean {
		return true;
	}
}
