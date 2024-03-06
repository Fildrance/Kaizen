import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import {
	DxTreeViewModule,
	DxTextBoxModule,
	DxButtonModule,
	DxTextAreaModule,
	DxToolbarModule,
	DxSliderModule,
	DxHtmlEditorModule,
	DxTooltipModule,
	DxSelectBoxModule
} from 'devextreme-angular';

import { SingleCardComponent } from '../layouts/single-card/single-card.component';
import { RoutesByTypes } from '../shared/models/util.models';
import { SelectableTreeViewComponent } from './components/selectable-tree/selectableTreeView.component';
import { SkillCategoryComponent } from './components/skill-category/skill-category.component';
import { SkillManagerComponent } from './components/skill-manager/skill-manager.component';
import { SkillManagerState } from './models/skill-manager-state';
import { SkillComponent } from './components/skill/skill.component';
import { SkillLevelComponent } from './components/skill-level/skill-level.component';
import { CommentsModule } from '../comments/comments.module';
import { SkillAggregationLevel } from '../shared/generated/model/skill-aggregation-level';
import { SkillLevelPrerequisiteService } from './components/skill-manager/skill-level-prerequisite.service';
import { SkillTreeService } from './components/skill-manager/skill-tree.service';

const map = new Map<SkillAggregationLevel, string>();
map.set(SkillAggregationLevel.SkillCategory, 'skill-category');
map.set(SkillAggregationLevel.Skill, 'skill');
map.set(SkillAggregationLevel.SkillLevel, 'skill-level');
const routesByTypes = new RoutesByTypes(map);

@NgModule({
	imports: [
		CommonModule,
		RouterModule,
		DxTreeViewModule,
		DxTextBoxModule,
		DxButtonModule,
		DxTextBoxModule,
		DxTextAreaModule,
		DxToolbarModule,
		DxSliderModule,
		DxTooltipModule,
		DxHtmlEditorModule,
		DxSelectBoxModule,
		CommentsModule
	],
	providers: [
		{ provide: RoutesByTypes, useValue: routesByTypes },
		SkillManagerState,
		SkillTreeService,
		SkillLevelPrerequisiteService
	],
	declarations: [
		SingleCardComponent,
		SkillManagerComponent,
		SelectableTreeViewComponent,
		SkillCategoryComponent,
		SkillComponent,
		SkillLevelComponent
	]
})
export class SkillModule {
}

