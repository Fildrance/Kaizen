import { Component, OnDestroy } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Subscription } from 'rxjs';
import { filter, switchMap } from 'rxjs/operators';

import { SkillCategoryItem } from 'src/app/shared/models/skill.model';
import { SkillManagerState } from '../../models/skill-manager-state';


@Component({
	templateUrl: 'skill-category.component.html',
	styleUrls: ['./skill-category.component.scss']
})
export class SkillCategoryComponent implements OnDestroy {

	public data: SkillCategoryItem;

	private subscription: Subscription;

	constructor(
		private state: SkillManagerState,
		activeRoute: ActivatedRoute
	) {
		this.subscription = activeRoute.url.pipe(
			switchMap(_ => this.state.SelectedNode$),
			filter(x => !x || x.NodeType === 'skill-category')
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
