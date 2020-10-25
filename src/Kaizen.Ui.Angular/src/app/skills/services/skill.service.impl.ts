import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

import { Page } from '../../shared/models/shared-models';
import { SkillCategoryChangeActiveContract, SkillCategoryCreateContract, SkillCategoryItem, SkillCategoryUpdateContract } from '../models/skill-models';
import { SkillService } from './skill.service';


@Injectable()
export class SkillServiceImpl implements SkillService {

	constructor(private httpClient: HttpClient) {
	}

	public toggleActive(contract: SkillCategoryChangeActiveContract): Observable<SkillCategoryItem> {
		return this.httpClient.post<SkillCategoryItem>('api/skill-category/toggle-activity', contract);
	}

	public create(contract: SkillCategoryCreateContract): Observable<SkillCategoryItem> {
		return this.httpClient.post<SkillCategoryItem>('/api/skill-category', contract);
	}

	public query(): Observable<Page<SkillCategoryItem>> {
		return this.httpClient.get<Page<SkillCategoryItem>>('/api/skill-category/list');
	}

	public update(contract: SkillCategoryUpdateContract): Observable<SkillCategoryItem> {
		return this.httpClient.put<SkillCategoryItem>('/api/skill-category', contract);
	}

}
