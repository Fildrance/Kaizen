import { LoadOptions } from 'devextreme/data';
import { CustomStoreOptions } from 'devextreme/data/custom_store';
import { Observable, lastValueFrom, map } from 'rxjs';

import { Page } from 'src/app/shared/models/shared.models';
import { TreeItem } from 'src/app/shared/models/skill.model';
import { TreeNodeViewModel } from 'src/app/shared/models/util.models';


export class FilterableTreeDataStore<TRootLevelItems extends TreeNodeViewModel<any, TNodeTypeEnum>, TNodeTypeEnum> {
	private _data: TreeNodeViewModel<TRootLevelItems, TNodeTypeEnum>[];
	private _filter: (node: any[]) => void;

	public totalCount: number;

	constructor(items: TreeNodeViewModel<TRootLevelItems, TNodeTypeEnum>[], filter?: (node: any[]) => void) {
		for (const item of items) {
			this.fillParent(item);
		}

		this._filter = filter;
		if (filter) {
			this.doApplyFilter(items, filter);
		}
		this._data = items;

	}

	public get data(): TreeNodeViewModel<TRootLevelItems, TNodeTypeEnum>[] {
		const duplicate = this._data.slice(0);
		if (this._filter) {
			this._filter(duplicate);
		}
		return duplicate;
	}

	public set data(value: TreeNodeViewModel<TRootLevelItems, TNodeTypeEnum>[]) {
		this._data = value;
	}

	private fillParent(node: TreeNodeViewModel<any, TNodeTypeEnum>): void {
		if (!node || !node.Items) {
			return;
		}
		for (const child of node.Items) {
			child.Parent = node;
			this.fillParent(child);
		}
	}

	private doApplyFilter(items: TreeNodeViewModel<any, TNodeTypeEnum>[], filter: (node: any[]) => void): void {
		items.forEach(x => {
			x.ItemsFilter = filter;
			if (x.Items && x.Items.length) {
				this.doApplyFilter(x.Items, filter);
			}
		});
	}

	public push(node: TreeNodeViewModel<TRootLevelItems, TNodeTypeEnum>): void {
		node.ItemsFilter = this._filter;
		this._data.push(node);
	}
}

export function createCustomStoreOptions<T extends TreeNodeViewModel<any, TNodeTypeEnum>, TNodeTypeEnum>(
	query: (filter: LoadOptions) => Observable<TreeNodeViewModel<T, TNodeTypeEnum>[]>,
	itemsFilter: (node: TreeItem<T>[]) => void
): CustomStoreOptions {

	let store: FilterableTreeDataStore<T, TNodeTypeEnum>;

	return {
		load: (options: LoadOptions) => {
			let promise: Promise<FilterableTreeDataStore<T, TNodeTypeEnum>>;
			if (store) {
				promise = new Promise((res, rej) => res(store));
			} else {
				promise = lastValueFrom(
					query(options)
						.pipe(
							map(items => {
								store = new FilterableTreeDataStore(
									items,
									itemsFilter
								);
								return store;
							})
						)
				);
			}

			return promise as Promise<any>;
		},
		update: (oldValue: any, newValue: any) => {
			const oldIndex = store.data.indexOf(oldValue);
			store.data[oldIndex] = Object.assign(oldValue, newValue);
			return new Promise<any>((resolve, _) => resolve(null));
		},
		insert: (newValue: any) => {
			store.push(newValue);
			return new Promise<any>((resolve, _) => resolve(null));
		}
	};
}
