import { HttpParams } from '@angular/common/http';

import { TreeNodeViewModel } from '../models/util.models';
import { SkillAggregationLevel } from '../models/skill.model';

export function HasId(item: { Id?: number }): boolean {
	return item.Id === 0 || item.Id > 0;
}

export function searchInTree(
	rootNodes: Array<TreeNodeViewModel<any, SkillAggregationLevel>>,
	idToFind: number,
	aggregationLevel: SkillAggregationLevel
): TreeNodeViewModel<any, SkillAggregationLevel> {
	return findRecursive(rootNodes, idToFind, aggregationLevel);
}

function findRecursive(items: Array<TreeNodeViewModel<any, SkillAggregationLevel>>, id: number, aggregationLevel: SkillAggregationLevel) {
	for (const item of items) {
		if (item.NodeType === aggregationLevel && item.Id === id) {
			return item;
		}
		if (item.Items && item.Items.length > 0) {
			const found = findRecursive(item.Items, id, aggregationLevel);
			if (found != null) {
				return found;
			}
		}
	}
	return null;
}

export class HttpParamsHelper {
	public static toHttpParams(obj: any, prefix: string | null = null, init: HttpParams | null = null): HttpParams {
		if (!init) {
			init = new HttpParams();
		}
		return Object.getOwnPropertyNames(obj)
			.reduce((p: any, key: string) => {
				const value = obj[key];
				const paramKey = (prefix && prefix.length) ? `${prefix}.${key}` : key;

				if (typeof value === 'function') {
					return;
				} else if (value instanceof Array) {
					value.forEach((v, i) => {
						if (v instanceof Object) {
							p = HttpParamsHelper.toHttpParams(v, paramKey + `[${i}]`, p);
						} else {
							p = p.append(paramKey, v);
						}
					});
				} else if (value instanceof Date) {
					p = p.set(paramKey, value.toISOString());
				} else if (value instanceof Object) {
					p = HttpParamsHelper.toHttpParams(value, paramKey, p);
				} else {
					if (undefined !== value
						&& null !== value) {
						p = p.set(paramKey, value);
					}
				}
				return p;
			}, init);
	}
}
