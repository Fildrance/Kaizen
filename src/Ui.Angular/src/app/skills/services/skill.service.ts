import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, map } from 'rxjs';

import { Page } from 'src/app/shared/models/shared.models';
import {
	SkillChangeActiveContract,
	SkillItem,
	SkillCreateContract,
	SkillUpdateContract,
	SkillCategoryChangeActiveContract,
	SkillCategoryItem,
	SkillCategoryCreateContract,
	SkillCategoryUpdateContract,
	SkillLevelCreateContract,
	SkillLevelItem,
	SkillLevelUpdateContract,
	SkillLevelChangeActiveContract,
	SkillTreeItem
} from 'src/app/shared/models/skill.model';

@Injectable()
export class SkillService implements SkillService {

	baseUrl: string = "";
	constructor(private httpClient: HttpClient) {

	}

	public toggleActiveSkill(contract: SkillChangeActiveContract): Observable<SkillItem> {
		return this.httpClient.post<SkillItem>(this.baseUrl + '/api/skills/toggle-activity', contract);
	}

	public createSkill(contract: SkillCreateContract): Observable<SkillItem> {
		return this.httpClient.post<SkillItem>(this.baseUrl + '/api/skills', contract);
	}

	public updateSkill(contract: SkillUpdateContract): Observable<SkillItem> {
		return this.httpClient.post<SkillItem>(this.baseUrl + '/api/skills', contract);
	}

	public toggleActiveCategory(contract: SkillCategoryChangeActiveContract): Observable<SkillCategoryItem> {
		return this.httpClient.post<SkillCategoryItem>(this.baseUrl + '/api/skill-categories/toggle-activity', contract);
	}

	public createCategory(contract: SkillCategoryCreateContract): Observable<SkillCategoryItem> {
		return this.httpClient.put<SkillCategoryItem>(this.baseUrl + '/api/skill-categories', contract);
	}

	public updateCategory(contract: SkillCategoryUpdateContract): Observable<SkillCategoryItem> {
		return this.httpClient.post<SkillCategoryItem>(this.baseUrl + '/api/skill-categories', contract);
	}

	public queryOld(): Observable<SkillCategoryItem[]> {
		return this.httpClient.post<SkillCategoryItem[]>(this.baseUrl + '/api/skill/query-old', { IncludeActive: "IncludeOnlyActive" })
			.pipe(
				map(x => {
					return x.map(item => item);
				})
			);
	}

	public query(): Observable<SkillTreeItem[]> {
		return this.httpClient.post<SkillTreeItem[]>(this.baseUrl + '/api/skill/query', { IncludeActive: "IncludeAll" })
			.pipe(
				map(x => {
					return x.map(item => item);
				})
			);
	}

	public createSkillLevel(contract: SkillLevelCreateContract): Observable<SkillLevelItem> {
		return this.httpClient.put<SkillLevelItem>(this.baseUrl + '/api/skill-levels', contract);
	}

	public updateSkillLevel(contract: SkillLevelUpdateContract): Observable<SkillLevelItem> {
		return this.httpClient.post<SkillLevelItem>(this.baseUrl + '/api/skill-levels', contract);
	}

	public toggleActiveSkillLevel(contract: SkillLevelChangeActiveContract): Observable<SkillLevelItem> {
		return this.httpClient.post<SkillLevelItem>(this.baseUrl + '/api/skill-levels/toggle-activity', contract);
	}

	public findSkillLevel(id: number): Observable<SkillLevelItem> {
		let params = new HttpParams()
			.set('Id', id);;
		return this.httpClient.get<SkillLevelItem>(this.baseUrl + '/api/skill-levels', { params: params });
	}

	public findSkillCategory(id: number): Observable<SkillCategoryItem> {
		let params = new HttpParams()
			.set('Id', id);;
		return this.httpClient.get<SkillLevelItem>(this.baseUrl + '/api/skill-categories', { params: params });
	}

	public findSkill(id: number): Observable<SkillItem> {
		let params = new HttpParams()
			.set('Id', id);
		return this.httpClient.get<SkillLevelItem>(this.baseUrl + '/api/skills', { params: params });
	}
}
