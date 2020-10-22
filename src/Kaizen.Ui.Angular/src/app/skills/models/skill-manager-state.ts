import { Injectable } from '@angular/core';
import { Observable, ReplaySubject, Subject } from 'rxjs';

import { SkillCategoryItem } from './skill-models';


@Injectable()
export class SkillManagerState {

	private selectedNode$: Subject<SkillCategoryItem>;

	public get SelectedNode$(): Observable<SkillCategoryItem> {
		return this.selectedNode$.asObservable();
	}

	constructor() {
		this.selectedNode$ = new ReplaySubject(1);
	}

	public selectNode(node: any): void {
		this.selectedNode$.next(node);
	}
}
