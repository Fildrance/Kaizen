import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Page } from '../../shared/models/shared-models';
import { SkillCategoryCreateContract, SkillCategoryItem } from '../models/skill-models';

@Injectable()
export class SkillService {

	constructor(private httpClient: HttpClient) {

	}

	public create(contract: SkillCategoryCreateContract): Observable<SkillCategoryItem> {
		return this.httpClient.post<SkillCategoryItem>('/api/skill-category', contract);
	}

	public query(): Observable<Page<SkillCategoryItem>> {
		return this.httpClient.get<Page<SkillCategoryItem>>('/api/skill-category/list');
	}
}
