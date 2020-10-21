import { Component, Input } from '@angular/core';

import DataSource from 'devextreme/data/data_source';

@Component({
	selector: 'kai-selectable-tree-view',
	templateUrl: 'selectableTreeView.component.html',
	styleUrls: ['selectableTreeView.component.scss']
})
export class SelectableTreeViewComponent {

	@Input()
	public dataSource: DataSource;

}
