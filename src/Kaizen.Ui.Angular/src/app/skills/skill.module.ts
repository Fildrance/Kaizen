import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

import { DxTreeViewModule, DxTextBoxModule, DxButtonModule, DxTextAreaModule, DxToolbarModule } from 'devextreme-angular';
import { environment } from 'src/environments/environment';

import { SingleCardModule } from '../layouts/single-card/single-card.component';
import { RoutesByTypes } from '../shared/models/shared-models';
import { SelectableTreeViewComponent } from './components/selectable-tree/selectableTreeView.component';
import { SkillCategoryComponent } from './components/skill-category/skill-category.component';
import { SkillManagerComponent } from './components/skill-manager/skill-manager.component';
import { SkillManagerState } from './models/skill-manager-state';
import { SkillService } from './services/skill.service';
import { SkillServiceImpl } from './services/skill.service.impl';
import { SkillServiceStub } from './services/stub/skill.service.stub';

const map = new Map<string, string>();
map.set('skill-category', 'skill-category');
map.set('skill', 'skill');
map.set('skill-level', 'skill-level');
const routesByTypes = new RoutesByTypes(map);

@NgModule({
	imports: [
		CommonModule,
		RouterModule,
		DxTreeViewModule,
		DxTextBoxModule,
		DxButtonModule,
		SingleCardModule,
		DxTextBoxModule,
		DxTextAreaModule,
		DxToolbarModule
	],
	providers: [
		{ provide: SkillService, useClass: environment.useStubs ? SkillServiceStub : SkillServiceImpl },
		{ provide: RoutesByTypes, useValue: routesByTypes },
		SkillManagerState
	],
	declarations: [SkillManagerComponent, SelectableTreeViewComponent, SkillCategoryComponent]
})
export class SkillModule {
}

