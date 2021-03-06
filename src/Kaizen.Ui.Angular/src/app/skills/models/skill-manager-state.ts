import { Injectable } from '@angular/core';
import { Observable, ReplaySubject, Subject } from 'rxjs';

import { SkillBase } from 'src/app/shared/models/skill.model';
import { TreeNode } from 'src/app/shared/models/util.models';

@Injectable()
export class SkillManagerState {

	private selectedNode$: Subject<SkillBase& TreeNode<any>>;

	public get SelectedNode$(): Observable<SkillBase & TreeNode<any>> {
		return this.selectedNode$.asObservable();
	}

	constructor() {
		this.selectedNode$ = new ReplaySubject(1);
	}

	public selectNode(node: any): void {
		this.selectedNode$.next(node);
	}
}
