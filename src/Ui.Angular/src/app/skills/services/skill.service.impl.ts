import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

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
	SkillLevelChangeActiveContract
} from 'src/app/shared/models/skill.model';

import { SkillService } from './skill.service';


@Injectable()
export class SkillServiceImpl implements SkillService {

	baseUrl: string = "";
	constructor(private httpClient: HttpClient) {

	}

	public toggleActiveSkill(contract: SkillChangeActiveContract): Observable<SkillItem> {
		return this.httpClient.post<SkillItem>(this.baseUrl + '/api/skill/toggle-activity', contract);
	}

	public createSkill(contract: SkillCreateContract): Observable<SkillItem> {
		return this.httpClient.post<SkillItem>(this.baseUrl + '/api/skill', contract);
	}

	public updateSkill(contract: SkillUpdateContract): Observable<SkillItem> {
		return this.httpClient.put<SkillItem>(this.baseUrl + '/api/skill', contract);
	}

	public toggleActiveCategory(contract: SkillCategoryChangeActiveContract): Observable<SkillCategoryItem> {
		return this.httpClient.post<SkillCategoryItem>(this.baseUrl + '/api/skill-category/toggle-activity', contract);
	}

	public createCategory(contract: SkillCategoryCreateContract): Observable<SkillCategoryItem> {
		return this.httpClient.post<SkillCategoryItem>(this.baseUrl + '/api/skill-category', contract);
	}

	public updateCategory(contract: SkillCategoryUpdateContract): Observable<SkillCategoryItem> {
		return this.httpClient.put<SkillCategoryItem>(this.baseUrl + '/api/skill-category', contract);
	}

	public query(): Observable<Page<SkillCategoryItem>> {
		return this.httpClient.post<Page<SkillCategoryItem>>(this.baseUrl + '/api/skill/query', { IncludeActive: "IncludeOnlyActive" });
	}

	public createSkillLevel(contract: SkillLevelCreateContract): Observable<SkillLevelItem> {
		return this.httpClient.post<SkillLevelItem>(this.baseUrl + '/api/skill-level', contract);
	}

	public updateSkillLevel(contract: SkillLevelUpdateContract): Observable<SkillLevelItem> {
		return this.httpClient.put<SkillLevelItem>(this.baseUrl + '/api/skill-level', contract);
	}

	public toggleActiveSkillLevel(contract: SkillLevelChangeActiveContract): Observable<SkillLevelItem> {
		return this.httpClient.post<SkillLevelItem>(this.baseUrl + '/api/skill-level/toggle-activity', contract);
	}
}