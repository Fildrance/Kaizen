import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import DataSource from 'devextreme/data/data_source';
import LoadOptions from 'devextreme/data/data_source';
import CustomStore from 'devextreme/data/custom_store';

import { SkillService } from '../../services/skill.service';

@Component({
	templateUrl: 'skill-manager.component.html',
	styleUrls: ['./skill-manager.component.scss']
})
export class SkillManagerComponent implements OnInit, OnDestroy {

	public dataSource: DataSource;

	private subscription = new Subscription();

	constructor(private client: SkillService) {
	}

	public ngOnDestroy(): void {
		this.subscription.unsubscribe();
	}

	public ngOnInit(): void {
		const opts: any = {
			load: (filter: LoadOptions) => {
				return this.client.query()
					.toPromise();
			}
		};
		this.dataSource = new DataSource(new CustomStore(opts));
	}
}
