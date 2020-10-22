import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';

import { SkillManagerComponent } from './skills/components/skill-manager/skill-manager.component';
import { SkillCategoryComponent } from './skills/components/skill-category/skill-category.component';
import { AdminComponent } from './admin/admin.component';
import { AdminModule } from './admin/admin.module';

const routes: Routes = [
	{
		path: 'admin',
		component: AdminComponent,
		children: [
			{ path: '', redirectTo: 'skill', pathMatch: 'full' },
			{
				path: 'skill',
				component: SkillManagerComponent,
				children: [
					{ path: 'skill-category', component: SkillCategoryComponent },
					{ path: 'skill-category/:id', component: SkillCategoryComponent }
				]
			},

		]
	},
	{
		path: '**',
		redirectTo: 'admin'
	}
];

@NgModule({
	imports: [RouterModule.forRoot(routes), CommonModule, AdminModule],
	exports: [RouterModule]
})
export class AppRoutingModule { }
