import { Component, Inject, OnDestroy } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Subscription, lastValueFrom } from 'rxjs';
import { map, take } from 'rxjs/operators';
import DataSource from 'devextreme/data/data_source';
import CustomStore from 'devextreme/data/custom_store';

import { SkillManagerState } from '../../models/skill-manager-state';
import { createCustomStoreOptions } from '../selectable-tree/filterable-tree-data-source';
import { TreeNodeViewModel, RoutesByTypes, DxButtonOptions } from 'src/app/shared/models/util.models';
import { SkillTreeItemViewModel } from '../../models/skill-models';
import { SkillCategoriesService } from '../../../shared/generated/api/skill-categories';
import { IncludeActiveOption } from '../../../shared/generated/model/include-active-option';
import { SkillTreeFilter } from '../../../shared/generated/model/skill-tree-filter';
import { SkillTreeItem } from '../../../shared/generated/model/skill-tree-item';
import { SkillAggregationLevel } from '../../../shared/generated/model/skill-aggregation-level';
import { searchInTree, HasId } from '../../../shared/services/utils.service';
import { SkillTreeService } from '../../services/skill-tree.service';

@Component({
	templateUrl: 'skill-manager.component.html',
	styleUrls: ['./skill-manager.component.scss']
})
export class SkillManagerComponent implements OnDestroy {

	private selected: TreeNodeViewModel<any, SkillAggregationLevel>;
	private subscription: Subscription = new Subscription();
	private addHandlers = new Map<SkillAggregationLevel, (_: any, dataSource: DataSource) => Promise<TreeNodeViewModel<any, SkillAggregationLevel>>>();

	public dataSource: DataSource;

	public get Selected(): TreeNodeViewModel<any, SkillAggregationLevel> | null {
		return this.selected;
	}

	public set Selected(value: TreeNodeViewModel<any, SkillAggregationLevel> | null) {
		this.tryNavigate(value);
		this.selected = value;
		this.state.selectNode(value);
	}

	constructor(
		private router: Router,
		private routesByTypes: RoutesByTypes,
		public state: SkillManagerState,
		private client: SkillTreeService,
		route: ActivatedRoute
	) {
		const opts = createCustomStoreOptions(_ => {
			return this.client.query({ IncludeActive: IncludeActiveOption.IncludeAll } as SkillTreeFilter)
				.pipe(
					map(
						x => {
							return x.map(item => SkillTreeItemViewModel.create(item));
						}
					)
				)
		}, _ => { });

		this.dataSource = new DataSource(
			new CustomStore(opts)
		);

		if (route.firstChild) {

			const subRoute = route.firstChild.routeConfig.path.split('/')[0];

			const routeChangedPromise = lastValueFrom(route.firstChild.params.pipe(map(x => parseInt(x.id, 10)), take(1)));

			const loadPromise = this.dataSource.load();

			Promise.all([routeChangedPromise, loadPromise]).then(x => {
				const idToFind = x[0];
				const aggregationLevel = routesByTypes.getKeyFor(subRoute);
				const found = searchInTree(this.dataSource.items(), idToFind, aggregationLevel);
				this.Selected = found;
			});
		}

		this.addHandlers.set(null, (a, ds) => this.addCategory(a, ds));
		this.addHandlers.set(SkillAggregationLevel.SkillCategory, (a, ds) => this.addSkill(a, ds));
		this.addHandlers.set(SkillAggregationLevel.Skill, (a, ds) => this.addSkillLevel(a, ds));

		this.refreshButtonOptions = {
			icon: 'refresh',
			onClick: () => {
				if (this.Selected) {
					if (this.state.editorRefresh) {
						this.state.editorRefresh()
							.subscribe();
					}
				} else {
					this.dataSource.reload();
				}
			}
		};
		this.addButtonOptions = {
			icon: 'add',
			onClick: () => {
				this.addNew()
					.then(x => this.Selected = x);
			}
		};
		this.saveButtonOptions = {
			icon: 'save',
			onClick: () => {
				if (this.state.editorSave) {
					this.state.editorSave()
						.subscribe(x => {
							this.selected.original = x.data;
							this.tryNavigate(this.selected, true);
						});
				}
			}
		};
		this.toggleActiveButtonOptions = {
			icon: 'isblank',
			text: 'toggle active',
			onClick: () => {
				if (this.state.editorToggleActive) {
					this.state.editorToggleActive()
						.subscribe();
				}
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

	public hasId(node: TreeNodeViewModel<any, SkillAggregationLevel>): boolean {
		return !!node && HasId(node);
	}
	public canHaveChild(node: TreeNodeViewModel<any, SkillAggregationLevel>): any {
		return !node || node.NodeType == SkillAggregationLevel.SkillCategory || node.NodeType == SkillAggregationLevel.Skill;
	}


	private tryNavigate(value: TreeNodeViewModel<any, SkillAggregationLevel>, force?: boolean): void {
		if (value === this.Selected && !force) {
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

	private addNew(): Promise<any> {
		let aggregationLevel: SkillAggregationLevel = SkillAggregationLevel.SkillCategory;
		if (this.Selected) {
			aggregationLevel = this.Selected.NodeType;
		}

		return this.addHandlers.get(aggregationLevel)(this.selected, this.dataSource)
			.then(x => {
				if (x) {
					this.Selected = x;
				}
			});
	}

	private addCategory(_: TreeNodeViewModel<any, SkillAggregationLevel>, dataSource: DataSource): Promise<TreeNodeViewModel<any, SkillAggregationLevel>> {
		const alreadyExistingUnsaved = dataSource.items()
			.find(i => !HasId(i));
		if (alreadyExistingUnsaved) {
			return Promise.resolve(alreadyExistingUnsaved);
		}
		const newRecord: SkillTreeItem = {
			NodeType: SkillAggregationLevel.SkillCategory,
			Items: [],
			Name: '',
			Id: 0,
			IsActive: true
		};
		dataSource.store().insert(SkillTreeItemViewModel.create(newRecord));
		return dataSource.reload()
			.then(() => dataSource.items().find(i => !HasId(i)));
	}

	private addSkill(selected: TreeNodeViewModel<any, SkillAggregationLevel>, dataSource: DataSource): Promise<TreeNodeViewModel<any, SkillAggregationLevel>> {
		if (!HasId(selected)) {
			return Promise.resolve(selected);
		}
		if (selected.Items) {
			const alreadyExistingUnsaved = selected.Items.find(i => !HasId(i));
			if (alreadyExistingUnsaved) {
				return Promise.resolve(alreadyExistingUnsaved);
			}
		}
		const newRecord: SkillTreeItem = {
			NodeType: SkillAggregationLevel.Skill,
			Items: [],
			Name: '',
			Id: 0,
			IsActive: true,
		};
		let newViewModel = SkillTreeItemViewModel.create(newRecord)
		newViewModel.Parent = selected;
		selected.Items.push(newViewModel);
		return dataSource.reload()
			.then(_ => newViewModel);
	}


	private addSkillLevel(selected: TreeNodeViewModel<any, SkillAggregationLevel>, dataSource: DataSource): Promise<TreeNodeViewModel<any, SkillAggregationLevel>> {
		if (!HasId(selected)) {
			return Promise.resolve(selected);
		}
		if (selected.Items) {
			const alreadyExistingUnsaved = selected.Items.find(i => !HasId(i));
			if (alreadyExistingUnsaved) {
				return Promise.resolve(alreadyExistingUnsaved);
			}
		}
		const newRecord: SkillTreeItem = {
			NodeType: SkillAggregationLevel.SkillLevel,
			Items: [],
			IsActive: true,
			Name: '',
			Id: 0
		};
		let newViewModel = SkillTreeItemViewModel.create(newRecord)
		newViewModel.Parent = selected;
		selected.Items.push(newViewModel);
		return dataSource.reload()
			.then(_ => newViewModel);
	}

}
