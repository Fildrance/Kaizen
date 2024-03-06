import { Observable, Subscription, filter, map, of, switchMap, take, tap } from "rxjs";
import { TreeNodeViewModel } from "src/app/shared/models/util.models";
import { SkillManagerState } from "../../models/skill-manager-state";
import { ActivatedRoute } from "@angular/router";
import { Component, OnDestroy, OnInit } from "@angular/core";
import { HasId } from "src/app/shared/services/utils.service";
import { SkillAggregationLevel } from "../../../shared/generated/model/skill-aggregation-level";

@Component({ template: '' })
export abstract class SkillItemRelatedComponentBase<TEditorViewModel extends { IsActive: boolean, Id?: number }, TInputModel> implements OnDestroy, OnInit {

	public data: TEditorViewModel;

	public selectedNode: TreeNodeViewModel<any, SkillAggregationLevel>;

	protected subscriptions: Subscription = new Subscription();

	protected constructor(
		protected state: SkillManagerState,
		private activeRoute: ActivatedRoute
	) {	}

	public ngOnInit(): void {
		this.subscriptions.add(
			this.activeRoute.url.pipe(
				switchMap(_ => this.state.SelectedNode$),
				filter(x => x && x.NodeType === this.Level),
				switchMap(
					x => {
						if (x.Id) {
							return this.find(x.Id)
								.pipe(map(res => { return ({ data: res, nodeFromTree: x }); }));
						} else {
							return of({
								data: this.createBlank(),
								nodeFromTree: x
							});
						}
					}
				)
			).subscribe(x => {
				this.state.editorToggleActive = () => {
					if (!HasId(this.data)) {
						this.data.IsActive = !this.data.IsActive;
						return;
					}
					return this.toggleActive()
						.pipe(
							tap(x => {
								if (x != null) {
									this.data.IsActive = x.IsActive
								}
							})
						);
				}
				this.state.editorSave = () => this.save();
				if (x.nodeFromTree.Id) {
					this.state.editorRefresh = () => this.refresh();
				}

				this.data = this.createViewModel(x.data, x.nodeFromTree);
			})
		);
	}

	public ngOnDestroy(): void {
		this.subscriptions.unsubscribe();
		this.state.editorRefresh = null;
		this.state.editorSave = null;
		this.state.editorToggleActive = null;
	}

	public get canEdit(): boolean {
		return true;
	}

	protected refresh(): Observable<any> {
		if (!this.data || !this.data.Id) {
			throw 'No current data selected, cannot refresh!';
		}

		return this.state.SelectedNode$.pipe(
			take(1),
			switchMap(
				x => this.find(this.data.Id)
					.pipe(map(res => ({ data: res, nodeFromTree: x })))
			),
			tap(x => {
				this.data = this.createViewModel(x.data, x.nodeFromTree);
			})
		);
	}

	protected abstract get Level(): SkillAggregationLevel;
	protected abstract find(id: number): Observable<TInputModel>;
	protected abstract createBlank(): TInputModel;
	protected abstract createViewModel(data: TInputModel, nodeFromTree: TreeNodeViewModel<any, SkillAggregationLevel>): TEditorViewModel;

	protected abstract save(): Observable<any>;
	protected abstract toggleActive(): Observable<{ IsActive: boolean }>;
}

export abstract class SkillEditorViewModel<TItem extends { Id?: number, Name?: string, IsActive?: boolean, ShortDescription?: string }> {

	constructor(
		protected item: TItem,
		protected fromTree: TreeNodeViewModel<any, SkillAggregationLevel>
	) {
		if (fromTree.Name !== item.Name) {
			fromTree.Name = item.Name;
		}
	}

	public get Name(): string {
		return this.item.Name;
	}

	public set Name(value: string) {
		this.fromTree.Name = value;
		this.item.Name = value;
	}

	public get IsActive(): boolean {
		return this.item.IsActive;
	}

	public set IsActive(value: boolean) {
		this.item.IsActive = value;
		this.fromTree.IsActive = value;
	}

	public get ShortDescription(): string | null {
		return this.item.ShortDescription;
	}

	public get Id(): number {
		return this.item.Id;
	}

	public set ShortDescription(value: string) {
		this.item.ShortDescription = value;
	}

	public get ParentId(): number {
		if (this.fromTree.Parent) {
			return this.fromTree.Parent.Id;
		}
		return null;
	}
}
