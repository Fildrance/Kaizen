import { AfterViewInit } from '@angular/core';
import { Component, EventEmitter, Input, Output, ViewChild } from '@angular/core';
import { DxTreeViewComponent } from 'devextreme-angular';
import DataSource from 'devextreme/data/data_source';

import { TreeNode } from '../../../shared/models/util.models';

@Component({
	selector: 'kai-selectable-tree-view',
	templateUrl: 'selectableTreeView.component.html',
	styleUrls: ['selectableTreeView.component.scss']
})
export class SelectableTreeViewComponent<TNode extends TreeNode<TChild>, TChild> implements AfterViewInit {

	private initialValue: TNode;

	@Input()
	public dataSource: DataSource;

	@Input()
	public set selected(value: TNode) {
		const treeInitialized = this.tree
			&& this.tree.instance;

		const noSelectedNode = () => this.tree.instance.getSelectedNodes().length === 0;

		const selectedNodeIsNotValue = () => this.tree.instance.getSelectedNodes()[0]
			&& this.tree.instance.getSelectedNodes()[0].itemData !== value;

		if (treeInitialized && (noSelectedNode() || selectedNodeIsNotValue())) {
			this.tree.instance.expandItem(value);
			this.tree.instance.selectItem(value);
		} else {
			this.initialValue = value;
		}
	}

	@ViewChild(DxTreeViewComponent)
	public tree: DxTreeViewComponent;

	@Output()
	public selectedChange: EventEmitter<TNode> = new EventEmitter();

	public ngAfterViewInit(): void {
		if (this.initialValue) {
			this.tree.instance.expandItem(this.initialValue);
			this.tree.instance.selectItem(this.initialValue);
		}
	}

	public selectedChanged(e: { itemData: TNode, node: { selected: boolean } }): void {
		if (e.itemData) {
			this.selectedChange.emit(e.node.selected ? e.itemData : null);
		}
	}
}
