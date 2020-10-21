import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';

import { SkillManagerComponent } from './skills/components/skill-manager/skill-manager.component';
import { SkillModule } from './skills/skill.module';

const routes: Routes = [
	{
		path: 'home',
		component: SkillManagerComponent
	},
	{
		path: '**',
		redirectTo: 'home'
	}
];

@NgModule({
	imports: [RouterModule.forRoot(routes), SkillModule, CommonModule],
	exports: [RouterModule]
})
export class AppRoutingModule { }
