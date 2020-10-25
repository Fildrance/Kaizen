import { Component, EventEmitter, Input, Output, ViewChild } from '@angular/core';
import { DxTreeViewComponent } from 'devextreme-angular';
import DataSource from 'devextreme/data/data_source';

import { TreeNode } from '../../models/skill-models';

@Component({
	selector: 'kai-selectable-tree-view',
	templateUrl: 'selectableTreeView.component.html',
	styleUrls: ['selectableTreeView.component.scss']
})
export class SelectableTreeViewComponent<T extends TreeNode> {

	@Input()
	public dataSource: DataSource;

	@Input()
	public set selected(value: T) {
		if (
			this.tree
			&& this.tree.instance
			&& this.tree.instance.getSelectedNodes()[0]
			&& this.tree.instance.getSelectedNodes()[0].itemData !== value
		) {
			this.tree.instance.selectItem(value);
		}
	}

	@ViewChild(DxTreeViewComponent)
	public tree: DxTreeViewComponent;

	@Output()
	public selectedChange: EventEmitter<T> = new EventEmitter();

	public selectedChanged(e: { itemData: T }): void {
		if (e.itemData) {
			this.selectedChange.emit(e.itemData);
		}
	}
}
