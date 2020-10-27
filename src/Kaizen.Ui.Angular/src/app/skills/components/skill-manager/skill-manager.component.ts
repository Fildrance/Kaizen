import { Component, Inject, OnDestroy } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { map, take } from 'rxjs/operators';
import DataSource from 'devextreme/data/data_source';
import CustomStore from 'devextreme/data/custom_store';

import { SkillService, SkillServiceToken } from '../../services/skill.service';
import { DxButtonOptions, RoutesByTypes } from '../../../shared/models/shared-models';
import {
	SkillBase,
	TreeNode
} from '../../models/skill-models';
import { SkillManagerState } from '../../models/skill-manager-state';
import { createCustomStoreOptions } from '../selectable-tree/filterable-tree-data-source';
import { HasId, searchInTree } from 'src/app/shared/services/utils.service';
import { SkillManagerService } from './skill-manager.service';

@Component({
	templateUrl: 'skill-manager.component.html',
	styleUrls: ['./skill-manager.component.scss']
})
export class SkillManagerComponent implements OnDestroy {

	public dataSource: DataSource;
	public get Selected(): TreeNode<any> & SkillBase {
		return this.selected;
	}
	public set Selected(value: TreeNode<any> & SkillBase) {
		this.tryNavigate(value);
		this.selected = value;
		this.state.selectNode(value);
	}

	private selected: TreeNode<any> & SkillBase;
	private store: CustomStore;
	private subscription: Subscription = new Subscription();

	constructor(
		@Inject(SkillServiceToken) private client: SkillService,
		private router: Router,
		private routesByTypes: RoutesByTypes,
		private state: SkillManagerState,
		route: ActivatedRoute,
		private managerService: SkillManagerService
	) {
		const opts = createCustomStoreOptions(_ => this.client.query(), _ => { });
		this.store = new CustomStore(opts);
		this.dataSource = new DataSource(this.store);

		if (route.firstChild) {

			const subRoute = route.firstChild.routeConfig.path.split('/')[0];

			const routeChangedPromise = route.firstChild.params.pipe(map(x => parseInt(x.id, 10)), take(1)).toPromise();

			const loadPromise = this.dataSource.load();

			Promise.all([routeChangedPromise, loadPromise]).then(x => {
				const idToFind = x[0];
				const found = searchInTree(this.dataSource.items(), idToFind, subRoute);
				this.Selected = found;
			});
		}

		this.refreshButtonOptions = {
			icon: 'refresh',
			onClick: () => {
				this.dataSource.reload();
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

	public hasId(node: TreeNode<any>): boolean {
		return HasId(node);
	}

	private tryNavigate(value: SkillBase & TreeNode<any>): void {
		if (value === this.Selected) {
			return;
		}

		const path = ['admin', 'skill-manager'];
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
		const res = this.managerService.addNode(this.Selected, this.dataSource);
		res.then(x => {
			if (x) {
				this.Selected = x;
			}
		});
	}

	private save(): void {
		this.managerService.saveNode(this.Selected, this.dataSource);
	}

	private toggleActive(): void {
		this.managerService.toggleNode(this.Selected, this.dataSource);
	}
}
