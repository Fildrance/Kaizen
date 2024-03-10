import { Injectable } from "@angular/core";
import { SkillLevelsService } from "../../shared/generated/api/skill-levels";
import { BehaviorSubject, EMPTY, Observable, Subject, expand, reduce, switchMap } from "rxjs";
import { SkillLevelPrerequisiteItem, SkillTreeItem } from "../../shared/generated/model/models";
import { map, refCount, shareReplay } from "rxjs/operators";
import { CacheService as CacheManagingService } from "../../shared/services/cache-managing.service";
import { SkillManagerState } from "../models/skill-manager-state";
import { SkillTreeService } from "./skill-tree.service";
import { SkillTreeListItem } from "../models/skill-tree-list-item";

@Injectable()
export class SkillLevelPrerequisiteService {

	private refresh$ = new BehaviorSubject<boolean>(false);
	cachedData$: Observable<SkillLevelPrerequisiteItem[]>;

	constructor(
		private skillLevelService: SkillLevelsService,
		private skillTreeService: SkillTreeService,
		cacheManager: CacheManagingService
	) {
		cacheManager.addDropByEndsWith('api/skill-levels', () => this.refresh$.next(true))
	}

	public queryPrerequisites(): Observable<SkillLevelPrerequisiteItem[]> {
		return this.cachedPrerequisites();
	}

	public querySkillLevels(): Observable<SkillTreeListItem[]> {
		return this.skillTreeService.query()
			.pipe(
				map(
					x => {
						return this.extractSkillLevels(x);
					}
				)
			);
	}

	private extractSkillLevels(skillTreeItems: SkillTreeItem[], parentName: string = ''): SkillTreeListItem[] {
		if (!skillTreeItems || !skillTreeItems.length) {
			return [];
		}

		let list = [];
		for (const item of skillTreeItems) {
			if (item.NodeType == "SkillLevel") {
				list.push({
					Id: item.Id,
					TreeName: parentName + ' => ' + item.Name,
					Name: item.Name,
					IsActive: item.IsActive
				});
			}
			list.push(...this.extractSkillLevels(item.Items, parentName + ' => ' + item.Name));
		}
		return list;
	}

	private cachedPrerequisites(): Observable<SkillLevelPrerequisiteItem[]> {
		return this.refresh$
			.pipe(
				switchMap(
					refresh => {
						if (refresh || !this.cachedData$) {
							this.cachedData$ = this.queryRawPrerequisites().pipe(
								shareReplay(1, 10_000)
							)
						}
						return this.cachedData$;
					}
				)
			)
	}

	private queryRawPrerequisites(): Observable<SkillLevelPrerequisiteItem[]> {
		const take = 500;
		let skip = 0;
		let list = [];
		return this.skillLevelService.queryPrerequisites(true, take, skip)
			.pipe(
				expand(
					response => {
						const currentCount = response.Items.length + list.length;
						if (response.TotalCount < currentCount) {
							skip = currentCount;
							return this.skillLevelService.queryPrerequisites(true, take, skip);
						}
						return EMPTY;
					}
				),
				reduce((acc, current) => acc.concat(current.Items), []),
			);
	}
}

