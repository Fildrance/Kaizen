import { Injectable } from '@angular/core';
import { Observable, ReplaySubject, Subject } from 'rxjs';
import { SkillAggregationLevel } from 'src/app/shared/models/skill.model';

import { TreeNodeViewModel } from 'src/app/shared/models/util.models';

@Injectable()
export class SkillManagerState {

	private selectedNode$: Subject<TreeNodeViewModel<any, SkillAggregationLevel>>;

	public get SelectedNode$(): Observable<TreeNodeViewModel<any, SkillAggregationLevel>> {
		return this.selectedNode$.asObservable();
	}

	constructor() {
		this.selectedNode$ = new ReplaySubject(1);
	}

	public selectNode(node: any): void {
		this.selectedNode$.next(node);
	}
}
