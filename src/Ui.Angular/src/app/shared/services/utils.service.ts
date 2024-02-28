import { HttpParams } from '@angular/common/http';

import { TreeNodeViewModel } from '../models/util.models';
import { SkillAggregationLevel } from '../models/skill.model';

export function HasId(item: { Id?: number }): boolean {
	return item.Id === 0 || item.Id > 0;
}

export function searchInTree(
	rootNodes: Array<TreeNodeViewModel<any, SkillAggregationLevel>>,
	idToFind: number,
	tierToBeSearched: string
): TreeNodeViewModel<any, SkillAggregationLevel> {
	if (tierToBeSearched === 'skill-category') {
		return rootNodes.find(i => i.Id === idToFind);
	} else if (tierToBeSearched === 'skill') {
		return findSkillById(rootNodes, idToFind);
	} else if (tierToBeSearched === 'skill-level') {
		return findSkillLevelById(rootNodes, idToFind);
	}
}

export function findSkillById(items: Array<TreeNodeViewModel<any, SkillAggregationLevel>>, id: number): TreeNodeViewModel<any, SkillAggregationLevel> {
	let found;
	for (const iterator of items) {
		if (iterator.Items) {
			found = iterator.Items.find((i: TreeNodeViewModel<any, SkillAggregationLevel>) => i.Id === id);
			if (found) {
				break;
			}
		}
	}
	return found;
}

export function findSkillLevelById(skillCats: Array<TreeNodeViewModel<any, SkillAggregationLevel>>, id: number): TreeNodeViewModel<any, SkillAggregationLevel> {
	let found;
	for (const skillCat of skillCats) {
		for (const skill of skillCat.Items) {
			if (skill.Items) {
				found = skill.Items.find((i: TreeNodeViewModel<any, SkillAggregationLevel>) => i.Id === id);
				if (found) {
					break;
				}
			}
		}
	}
	return found;
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
