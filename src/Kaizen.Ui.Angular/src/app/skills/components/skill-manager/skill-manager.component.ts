import { Component, OnDestroy } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { map, take } from 'rxjs/operators';
import DataSource from 'devextreme/data/data_source';
import CustomStore from 'devextreme/data/custom_store';

import { SkillService } from '../../services/skill.service';
import { DxButtonOptions, RoutesByTypes } from '../../../shared/models/shared-models';
import {
	SkillBase,
	SkillCategoryCreateContract,
	SkillCategoryItem,
	SkillCategoryUpdateContract,
	TreeNode
} from '../../models/skill-models';
import { SkillManagerState } from '../../models/skill-manager-state';
import { createCustomStoreOptions } from '../selectable-tree/filterable-tree-data-source';

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

	constructor(
		private client: SkillService,
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
	}

	public refreshButtonOptions: DxButtonOptions;
	public addButtonOptions: DxButtonOptions;
	public saveButtonOptions: DxButtonOptions;

	public ngOnDestroy(): void {
		this.Selected = null;
	}

	private tryNavigate(value: SkillBase & TreeNode): void {

		if (!value || value === this.Selected) {
			return;
		}

		const routeByType = this.routesByTypes.get(value.NodeType);

		const path = ['admin', 'skill', routeByType];
		if (value.Id) {
			path.push(value.Id.toString());
		}

		this.router.navigate(path);
	}

	private addNew(): void {
		const alreadyExistingUnsaved = this.dataSource.items().find(i => !i.Id);
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
				const newItem = this.dataSource.items().find(i => !i.Id);
				this.Selected = newItem;
			});
	}

	private save(): void {
		let observable: Observable<SkillCategoryItem>;
		if (this.Selected.Id) {
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
		observable.subscribe(x => {
			Object.assign(this.Selected, x);
			this.Selected = x;
		});
	}
}
