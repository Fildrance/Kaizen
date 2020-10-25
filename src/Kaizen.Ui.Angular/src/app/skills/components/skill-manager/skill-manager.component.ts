import { Component, Inject, OnDestroy } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable, Subscription } from 'rxjs';
import { map, take } from 'rxjs/operators';
import DataSource from 'devextreme/data/data_source';
import CustomStore from 'devextreme/data/custom_store';

import { SkillService, SkillServiceToken } from '../../services/skill.service';
import { DxButtonOptions, RoutesByTypes } from '../../../shared/models/shared-models';
import {
	SkillBase,
	SkillCategoryChangeActiveContract,
	SkillCategoryCreateContract,
	SkillCategoryItem,
	SkillCategoryUpdateContract,
	TreeNode
} from '../../models/skill-models';
import { SkillManagerState } from '../../models/skill-manager-state';
import { createCustomStoreOptions } from '../selectable-tree/filterable-tree-data-source';
import { HasId } from 'src/app/shared/services/utils.service';

@Component({
	templateUrl: 'skill-manager.component.html',
	styleUrls: ['./skill-manager.component.scss']
})
export class SkillManagerComponent implements OnDestroy {

	public dataSource: DataSource;
	public get Selected(): TreeNode & SkillBase {
		return this.selected;
	}
	public set Selected(value: TreeNode & SkillBase) {
		this.tryNavigate(value);
		this.selected = value;
		this.state.selectNode(value);
	}

	private selected: TreeNode & SkillBase;
	private store: CustomStore;
	private subscription: Subscription = new Subscription();

	constructor(
		@Inject(SkillServiceToken) private client: SkillService,
		private router: Router,
		private routesByTypes: RoutesByTypes,
		private state: SkillManagerState,
		route: ActivatedRoute
	) {
		const opts = createCustomStoreOptions(_ => this.client.query(), _ => { });
		this.store = new CustomStore(opts);
		this.dataSource = new DataSource(this.store);

		if (route.firstChild) {

			const routeChangedPromise = route.firstChild.params.pipe(map(x => parseInt(x.id, 10)), take(1)).toPromise();

			const loadPromise = this.dataSource.load();

			Promise.all([routeChangedPromise, loadPromise]).then(x => {
				const found = this.dataSource.items().find(i => i.Id === x[0]);
				this.Selected = found;
			});
		}

		this.refreshButtonOptions = {
			icon: 'refresh',
			onClick: () => {
				console.log('refresh!');
			}
		};
		this.addButtonOptions = {
			icon: 'add',
			onClick: () => {
				this.addNew();
			}
		};
		this.saveButtonOptions = {
			icon: 'save',
			onClick: () => {
				this.save();
			}
		};
		this.toggleActiveButtonOptions = {
			icon: 'isblank',
			text: 'toggle active',
			onClick: () => {
				this.toggleActive();
			}
		};
	}

	public refreshButtonOptions: DxButtonOptions;
	public addButtonOptions: DxButtonOptions;
	public saveButtonOptions: DxButtonOptions;
	public toggleActiveButtonOptions: DxButtonOptions;

	public ngOnDestroy(): void {
		this.Selected = null;
		this.subscription.unsubscribe();
	}

	private tryNavigate(value: SkillBase & TreeNode): void {

		if (value === this.Selected) {
			return;
		}
		const path = ['admin', 'skill'];
		if (!value) {
			this.router.navigate(path);
			return;
		}

		const routeByType = this.routesByTypes.get(value.NodeType);
		path.push(routeByType);

		if (HasId(value)) {
			path.push(value.Id.toString());
		}

		this.router.navigate(path);
	}

	private addNew(): void {
		const alreadyExistingUnsaved = this.dataSource.items().find(i => !HasId(i));
		if (alreadyExistingUnsaved) {
			this.Selected = alreadyExistingUnsaved;
			return;
		}
		const newRecord = {
			NodeType: 'skill-category'
		};
		this.store.insert(newRecord);
		this.dataSource.reload()
			.then(() => {
				const newItem = this.dataSource.items().find(i => !HasId(i));
				this.Selected = newItem;
			});
	}

	private save(): void {
		let observable: Observable<SkillCategoryItem>;
		if (HasId(this.Selected)) {
			const contract: SkillCategoryUpdateContract = {
				ToUpdate: { Id: this.Selected.Id },
				Name: this.Selected.Name,
				ShortDescription: this.Selected.ShortDescription
			};
			observable = this.client.update(contract);
		} else {
			const contract: SkillCategoryCreateContract = {
				Name: this.Selected.Name,
				ShortDescription: this.Selected.ShortDescription
			};
			observable = this.client.create(contract);
		}
		this.subscription.add(
			observable.subscribe(x => {
				this.dataSource.reload();
			})
		);
	}

	private toggleActive(): void {
		const contract: SkillCategoryChangeActiveContract = {
			ToUpdate: { Id: this.Selected.Id },
			IsActive: !this.Selected.IsActive
		};
		const observable = this.client.toggleActive(contract);
		this.subscription.add(
			observable.subscribe(x => {
				this.dataSource.reload();
			})
		);
	}
}
