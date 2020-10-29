import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

import { Page } from '../shared/models/shared-models';
import { HttpParamsHelper } from '../shared/services/utils.service';
import {
	CommentCreateContract,
	CommentFilter,
	CommentItem,
	CommentDeleteContract,
	CommentUpdateContract
} from './comments.model';

@Injectable()
export class CommentsService {

	constructor(private httpClient: HttpClient) {
	}

	public create(contract: CommentCreateContract): Observable<CommentItem> {
		return this.httpClient.post<CommentItem>('/api/comment', contract);
	}

	public query(filter: CommentFilter): Observable<Page<CommentItem>> {
		return this.httpClient.get<Page<CommentItem>>('/api/comment/list', { params: HttpParamsHelper.toHttpParams(filter) });
	}

	public update(contract: CommentUpdateContract): Observable<CommentItem> {
		return this.httpClient.put<CommentItem>('/api/comment', contract);
	}

	public delete(contract: CommentDeleteContract): Observable<any> {
		return this.httpClient.delete('/api/comment', { params: HttpParamsHelper.toHttpParams(contract) });
	}
}
