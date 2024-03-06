import { Injectable } from "@angular/core";
import { SkillLevelsService } from "../../../shared/generated/api/skill-levels";
import { EMPTY, Observable, Subject, expand, reduce, switchMap } from "rxjs";
import { SkillLevelPrerequisiteItem, SkillTreeItem } from "../../../shared/generated/model/models";
import { map, shareReplay } from "rxjs/operators";
import { CacheService as CacheManagingService } from "../../../shared/services/cache-managing.service";
import { SkillManagerState } from "../../models/skill-manager-state";
import { SkillTreeService } from "./skill-tree.service";

@Injectable()
export class SkillLevelPrerequisiteService {

	private refresh$ = new Subject<boolean>();
	cachedData$: Observable<SkillLevelPrerequisiteItem[]>;

	constructor(
		private skillLevelService: SkillLevelsService,
		private skillTreeService: SkillTreeService,
		cacheManager: CacheManagingService
	) {
		cacheManager.addDropByEndsWith('api/skill-levels', () => this.refresh$.next(true))
	}

	public query(): Observable<SkillLevelPrerequisiteItem[]> {

		return this.queryRawPrerequisites()
			.pipe(
				switchMap(
					prerequisites => this.querySkillLevels()
						.pipe(
							map(x => ({ skillLevels: this.extractSkillLevels(x), prerequisites }))
						)
				)
			) as any;
	}

	public querySkillLevels(): Observable<{ Id: number, Name: string, TreeName: string, IsActive: boolean }[]> {

		return this.skillTreeService.query()
			.pipe(
				map(
					x => {
						return this.extractSkillLevels(x);
					}
				)
			)

	}

	private extractSkillLevels(skillTreeItems: SkillTreeItem[], parentName: string = ''): { Id: number, Name: string, TreeName: string, IsActive: boolean }[] {
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
		let backendData$ = this.queryRawPrerequisites();
		this.cachedData$ = backendData$.pipe(shareReplay(1));

		return this.refresh$
			.pipe(
				switchMap(
					refresh => refresh
						? backendData$
						: this.cachedData$
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
