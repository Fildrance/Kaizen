import { Injectable } from '@angular/core';
import { Observable, ReplaySubject, Subject } from 'rxjs';

import { SkillAggregationLevel } from '../../shared/generated/model/skill-aggregation-level';
import { TreeItem } from '../../shared/models/shared.models';
import { TreeNodeViewModel } from '../../shared/models/util.models';

@Injectable()
export class SkillManagerState {
	private selectedNode$: Subject<TreeNodeViewModel<any, SkillAggregationLevel>>;
	public editorSave: () => Observable<{ data: TreeItem<SkillAggregationLevel> }> | null;
	public editorRefresh: () => Observable<any> | null;
	public editorToggleActive: () => Observable<any> | null;


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
