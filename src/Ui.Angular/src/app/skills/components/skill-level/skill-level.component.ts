import { Component, Inject, OnDestroy } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Subscription } from 'rxjs';
import { filter, map, switchMap } from 'rxjs/operators';

import { SkillAggregationLevel, SkillLevelItem } from 'src/app/shared/models/skill.model';
import { SkillManagerState } from '../../models/skill-manager-state';
import { SkillService, SkillServiceToken } from '../../services/skill.service';
import { TreeNodeViewModel } from 'src/app/shared/models/util.models';


@Component({
	templateUrl: 'skill-level.component.html',
	styleUrls: ['./skill-level.component.scss']
})
export class SkillLevelComponent implements OnDestroy {

	public data: SkillLevelItem;
	public selectedNode: TreeNodeViewModel<any, SkillAggregationLevel>;

	private subscription: Subscription;

	constructor(
		private state: SkillManagerState,
		activeRoute: ActivatedRoute,
		@Inject(SkillServiceToken) private client: SkillService,

	) {
		this.subscription = activeRoute.url.pipe(
			switchMap(_ => this.state.SelectedNode$),
			filter(x => x && x.NodeType === SkillAggregationLevel.SkillLevel),
			switchMap(
				x => client.findSkillLevel(x.Id)
					.pipe(map(res => { return ({ data: res, selectedNode: x }); }))
			)
		).subscribe(x => {
			debugger;
			this.data = x.data;
			this.selectedNode = x.selectedNode;
		});
	}

	public ngOnDestroy(): void {
		this.subscription.unsubscribe();
	}

	public get canEdit(): boolean {
		return true;
	}
}
