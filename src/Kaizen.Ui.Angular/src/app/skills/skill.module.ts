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
import { SkillServiceImpl } from './services/skill.service.impl';
import { SkillServiceToken } from './services/skill.service';
import { SkillServiceStub } from './services/skill.service.stub';
import { SkillComponent } from './components/skill/skill.component';
import { SkillManagerService } from './components/skill-manager/skill-manager.service';

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
		{ provide: SkillServiceToken, useClass: environment.useStubs ? SkillServiceStub : SkillServiceImpl },
		{ provide: RoutesByTypes, useValue: routesByTypes },
		SkillManagerState,
		SkillManagerService
	],
	declarations: [SkillManagerComponent, SelectableTreeViewComponent, SkillCategoryComponent, SkillComponent]
})
export class SkillModule {
}

