import { Injectable } from "@angular/core";
import { SkillCategoriesService } from "../../../shared/generated/api/api";
import { IncludeActiveOption, SkillTreeFilter, SkillTreeItem } from "../../../shared/generated/model/models";
import { Observable, shareReplay } from "rxjs";

@Injectable()
export class SkillTreeService {

	map = new Map<IncludeActiveOption, Observable<SkillTreeItem[]>>;

	constructor(
		private client: SkillCategoriesService
	) {

	}

	public query(body?: SkillTreeFilter): Observable<SkillTreeItem[]> {
		let val = body ? body.IncludeActive : IncludeActiveOption.IncludeAll;

		let found = this.map.get(val);
		if (found) {
			return found;
		}

		let serverData$ = this.client.query(body);
		found = serverData$.pipe(shareReplay(1));
		this.map.set(body.IncludeActive, found);
		return found;

	}
}
