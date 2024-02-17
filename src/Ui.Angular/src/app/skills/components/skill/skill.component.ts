import { Component, OnDestroy } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Subscription } from 'rxjs';
import { filter, switchMap } from 'rxjs/operators';

import { SkillItem } from '../../../shared/models/skill.model';
import { SkillManagerState } from '../../models/skill-manager-state';


@Component({
	templateUrl: 'skill.component.html',
	styleUrls: ['./skill.component.scss']
})
export class SkillComponent implements OnDestroy {

	public data: SkillItem;

	private subscription: Subscription;

	constructor(
		private state: SkillManagerState,
		activeRoute: ActivatedRoute
	) {
		this.subscription = activeRoute.url.pipe(
			switchMap(_ => this.state.SelectedNode$),
			filter(x => !x || x.NodeType === 'skill')
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
