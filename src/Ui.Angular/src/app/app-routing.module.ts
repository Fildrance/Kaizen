import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';

import { SkillManagerComponent } from './skills/components/skill-manager/skill-manager.component';
import { SkillCategoryComponent } from './skills/components/skill-category/skill-category.component';
import { SkillComponent } from './skills/components/skill/skill.component';
import { SkillLevelComponent } from './skills/components/skill-level/skill-level.component';
import { environment } from '../environments/environment';
import { AuthGuard } from './auth-guard';

const routes: Routes = [
	{ path: '', redirectTo: 'admin/skill-manager', pathMatch: 'full' },
	{
		path: 'admin/skill-manager',
		component: SkillManagerComponent,
		canActivate: [AuthGuard],
		children: [
			{ path: 'skill-category', component: SkillCategoryComponent },
			{ path: 'skill-category/:id', component: SkillCategoryComponent },
			{ path: 'skill', component: SkillComponent },
			{ path: 'skill/:id', component: SkillComponent },
			{ path: 'skill-level', component: SkillLevelComponent },
			{ path: 'skill-level/:id', component: SkillLevelComponent }
		]
	},
	{
		path: '**',
		redirectTo: 'admin/skill-manager'
	}
];

@NgModule({
	imports: [RouterModule.forRoot(routes, { enableTracing: environment.traceRouting }), CommonModule],
	exports: [RouterModule]
})
export class AppRoutingModule { }
