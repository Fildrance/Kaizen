import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

import { Page } from '../../shared/models/shared-models';
import {
	SkillCategoryChangeActiveContract,
	SkillCategoryCreateContract,
	SkillCategoryItem,
	SkillCategoryUpdateContract,
	SkillChangeActiveContract,
	SkillCreateContract,
	SkillItem,
	SkillUpdateContract
} from '../models/skill-models';
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
}
