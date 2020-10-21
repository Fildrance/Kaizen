import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';

import { DxTreeViewModule, DxTextBoxModule, DxButtonModule } from 'devextreme-angular';
import { environment } from 'src/environments/environment';

import { SingleCardModule } from '../layouts/single-card/single-card.component';
import { SelectableTreeViewComponent } from './components/selectable-tree/selectableTreeView.component';
import { SkillManagerComponent } from './components/skill-manager/skill-manager.component';
import { SkillService } from './services/skill.service';
import { SkillServiceStub } from './services/stub/skill.service.stub';

@NgModule({
	imports: [CommonModule, RouterModule, DxTreeViewModule, DxTextBoxModule, DxButtonModule, SingleCardModule, DxTextBoxModule],
	providers: [{ provide: SkillService, useClass: environment.useStubs ? SkillServiceStub : SkillService }],
	declarations: [SkillManagerComponent, SelectableTreeViewComponent]
})
export class SkillModule {
}

