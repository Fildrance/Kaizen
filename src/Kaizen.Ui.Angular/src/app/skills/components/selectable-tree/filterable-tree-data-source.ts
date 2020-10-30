import { CustomStoreOptions } from 'devextreme/data/custom_store';
import { LoadOptions } from 'devextreme/data/load_options';
import { Observable } from 'rxjs';

import { Page } from 'src/app/shared/models/shared.models';
import { TreeNode } from 'src/app/shared/models/util.models';


export class FilterableTreeDataStore<TRootLevelItems> {
	private _data: TreeNode<TRootLevelItems>[];
	private _filter: (node: any[]) => void;

	public totalCount: number;

	constructor(items: TreeNode<TRootLevelItems>[], filter?: (node: any[]) => void) {
		for (const item of items) {
			this.fillParent(item);
		}

		this._filter = filter;
		if (filter) {
			this.doApplyFilter(items, filter);
		}
		this._data = items;

	}

	public get data(): TreeNode<TRootLevelItems>[] {
		const duplicate = this._data.slice(0);
		if (this._filter) {
			this._filter(duplicate);
		}
		return duplicate;
	}

	public set data(value: TreeNode<TRootLevelItems>[]) {
		this._data = value;
	}

	private fillParent(node: TreeNode<any>): void {
		if (!node || !node.Items) {
			return;
		}
		for (const child of node.Items) {
			child.Parent = node;
			this.fillParent(child);
		}
	}

	private doApplyFilter(items: TreeNode<any>[], filter: (node: any[]) => void): void {
		items.forEach(x => {
			x.ItemsFilter = filter;
			if (x.Items && x.Items.length) {
				this.doApplyFilter(x.Items, filter);
			}
		});
	}

	public push(node: TreeNode<TRootLevelItems>): void {
		node.ItemsFilter = this._filter;
		this._data.push(node);
	}
}

export function createCustomStoreOptions<T>(
	query: (filter: LoadOptions) => Observable<Page<any>>,
	itemsFilter: (node: any[]) => void
): CustomStoreOptions {

	let store: FilterableTreeDataStore<T>;

	return {
		load: (options: LoadOptions) => {
			let promise: Promise<FilterableTreeDataStore<T>>;
			if (store) {
				promise = new Promise((res, rej) => res(store));
			} else {
				promise = query(options).toPromise()
					.then((result: Page<any>) => {
						store = new FilterableTreeDataStore(
							result.Items,
							itemsFilter
						);
						return store;
					});
			}

			return promise as Promise<any>;
		},
		update: (oldValue: any, newValue: any) => {
			const oldIndex = store.data.indexOf(oldValue);
			store.data[oldIndex] = Object.assign(oldValue, newValue);
			return new Promise<any>((resolve, _) => resolve());
		},
		insert: (newValue: any) => {
			store.push(newValue);
			return new Promise<any>((resolve, _) => resolve());
		}
	};
}
