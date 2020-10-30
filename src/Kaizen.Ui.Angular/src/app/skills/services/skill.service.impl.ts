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

	constructor(private httpClient: HttpClient) {
	}

	public toggleActiveSkill(contract: SkillChangeActiveContract): Observable<SkillItem> {
		return this.httpClient.post<SkillItem>('api/skill/toggle-activity', contract);
	}

	public createSkill(contract: SkillCreateContract): Observable<SkillItem> {
		return this.httpClient.post<SkillItem>('/api/skill', contract);
	}

	public updateSkill(contract: SkillUpdateContract): Observable<SkillItem> {
		return this.httpClient.put<SkillItem>('/api/skill', contract);
	}

	public toggleActiveCategory(contract: SkillCategoryChangeActiveContract): Observable<SkillCategoryItem> {
		return this.httpClient.post<SkillCategoryItem>('api/skill-category/toggle-activity', contract);
	}

	public createCategory(contract: SkillCategoryCreateContract): Observable<SkillCategoryItem> {
		return this.httpClient.post<SkillCategoryItem>('/api/skill-category', contract);
	}

	public updateCategory(contract: SkillCategoryUpdateContract): Observable<SkillCategoryItem> {
		return this.httpClient.put<SkillCategoryItem>('/api/skill-category', contract);
	}

	public query(): Observable<Page<SkillCategoryItem>> {
		return this.httpClient.get<Page<SkillCategoryItem>>('/api/skill-category/list');
	}

	public createSkillLevel(contract: SkillLevelCreateContract): Observable<SkillLevelItem> {
		return this.httpClient.post<SkillLevelItem>('/api/skill-level', contract);
	}

	public updateSkillLevel(contract: SkillLevelUpdateContract): Observable<SkillLevelItem> {
		return this.httpClient.put<SkillLevelItem>('/api/skill-level', contract);
	}

	public toggleActiveSkillLevel(contract: SkillLevelChangeActiveContract): Observable<SkillLevelItem> {
		return this.httpClient.post<SkillLevelItem>('api/skill-level/toggle-activity', contract);
	}
}
