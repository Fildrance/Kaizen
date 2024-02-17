import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { DxTabsModule } from 'devextreme-angular';

import { SingleCardModule } from '../layouts/single-card/single-card.component';
import { AdminComponent } from './admin.component';
import { SkillModule } from '../skills/skill.module';

@NgModule({
	imports: [DxTabsModule, SingleCardModule, RouterModule, SkillModule],
	declarations: [AdminComponent],
})
export class AdminModule {

}
